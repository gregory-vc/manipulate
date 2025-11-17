using Microsoft.EntityFrameworkCore;
using MyProjectNamespace;

var connectionString = Environment.GetEnvironmentVariable("EF_CONNECTION_STRING")
                      ?? "Host=localhost;Port=5432;Database=efdb;Username=postgres;Password=postgres";
var experimentProperties = typeof(Experiments).GetProperties();
                      
var options = new DbContextOptionsBuilder<PublicDbContext>()
    .UseNpgsql(connectionString)
    .Options;

await using var context = new PublicDbContext(options);

try
{
    var inserted = await AddExperimentAsync(context);
    Console.WriteLine("\nПосле вставки:");
    PrintTableHeader();
    PrintRow(inserted);

    var updated = await UpdateExperimentAsync(context, inserted.Id);
    Console.WriteLine("\nПосле обновления:");
    PrintTableHeader();
    if (updated is not null)
    {
        PrintRow(updated);
    }
    else
    {
        Console.WriteLine($"Эксперимент с ID {inserted.Id} не найден для обновления.");
    }

    var deleted = await DeleteExperimentAsync(context, inserted.Id);
    Console.WriteLine("\nПосле удаления:");
    if (deleted)
    {
        var check = await context.experiments.AsNoTracking()
            .FirstOrDefaultAsync(e => e.Id == inserted.Id);
        Console.WriteLine(check is null
            ? $"Эксперимент с ID {inserted.Id} удалён."
            : "Удаление не выполнено.");
    }
    else
    {
        Console.WriteLine($"Эксперимент с ID {inserted.Id} не найден для удаления.");
    }

    var experiments = await context.experiments
        .AsNoTracking()
        .OrderByDescending(e => e.Id)
        .Take(10)
        .ToListAsync();

    if (experiments.Count == 0)
    {
        Console.WriteLine("Таблица experiments пуста.");
        return;
    }

    PrintTableHeader();
    experiments.ForEach(PrintRow);
}
catch (Exception ex)
{
    Console.Error.WriteLine($"Не удалось получить данные: {ex.Message}");
    Environment.ExitCode = 1;
}

void PrintTableHeader()
{
    var header = string.Join(" | ", experimentProperties.Select(p => p.Name));
    Console.WriteLine(header);
    Console.WriteLine(new string('-', header.Length));
}

void PrintRow(Experiments exp)
{
    var values = experimentProperties.Select(p =>
    {
        var value = p.GetValue(exp);
        return value switch
        {
            null => "null",
            decimal d => d.ToString("0.##"),
            _ => value?.ToString() ?? string.Empty
        };
    });
    Console.WriteLine(string.Join(" | ", values));
}

async Task<Experiments> AddExperimentAsync(PublicDbContext dbContext)
{
    var entity = new Experiments
    {
        Year = 2024,
        Field = 50,
        Culture_id = 3,
        Predecessor_id = 4,
        Condition_id = 2,
        Yield = 30
    };

    dbContext.experiments.Add(entity);
    await dbContext.SaveChangesAsync();
    Console.WriteLine($"Inserted ID: {entity.Id}");
    return entity;
}

async Task<Experiments?> UpdateExperimentAsync(PublicDbContext dbContext, int id)
{
    var entity = await dbContext.experiments.FirstOrDefaultAsync(e => e.Id == id);
    if (entity is null)
    {
        return null;
    }

    entity.Yield = (entity.Yield ?? 0) + 5;
    entity.Field = (entity.Field ?? 0) + 1;
    entity.Year = (entity.Year ?? DateTime.UtcNow.Year) + 1;

    await dbContext.SaveChangesAsync();
    await dbContext.Entry(entity).ReloadAsync();
    return entity;
}

async Task<bool> DeleteExperimentAsync(PublicDbContext dbContext, int id)
{
    var entity = await dbContext.experiments.FirstOrDefaultAsync(e => e.Id == id);
    if (entity is null)
    {
        return false;
    }

    dbContext.experiments.Remove(entity);
    await dbContext.SaveChangesAsync();
    return true;
}
