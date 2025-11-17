using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace MyProjectNamespace
{
	[Table("conditions")]
	[PrimaryKey(nameof(Id))]
	public class Conditions
	{
		[Column("id")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[Column("name")]
		public string Name { get; set; } = null!;
	}

	[Table("cultures")]
	[PrimaryKey(nameof(Id))]
	public class Cultures
	{
		[Column("id")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[Column("name")]
		public string Name { get; set; } = null!;
	}

	[Table("experiments")]
	[PrimaryKey(nameof(Id))]
	public class Experiments
	{
		[Column("id")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[Column("year")]
		public int? Year { get; set; }

		[Column("field")]
		public int? Field { get; set; }

		[Column("culture_id")]
		public int? Culture_id { get; set; }

		[Column("predecessor_id")]
		public int? Predecessor_id { get; set; }

		[Column("condition_id")]
		public int? Condition_id { get; set; }

		[Column("yield")]
		public decimal? Yield { get; set; }
	}

	[Table("predecessors")]
	[PrimaryKey(nameof(Id))]
	public class Predecessors
	{
		[Column("id")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[Column("name")]
		public string Name { get; set; } = null!;
	}
}
