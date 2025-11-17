using System;
using Microsoft.EntityFrameworkCore;

namespace MyProjectNamespace
{
	public class PublicDbContext : DbContext
	{
		public PublicDbContext(DbContextOptions<PublicDbContext> options) : base(options) { }
		public DbSet<Cultures> cultures { get; set; }
		public DbSet<Experiments> experiments { get; set; }
		public DbSet<Predecessors> predecessors { get; set; }
		public DbSet<Conditions> conditions { get; set; }

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			// Конфигурации моделей можно добавить здесь
		}
	}
}

