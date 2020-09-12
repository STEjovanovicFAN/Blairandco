﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="BCTest")]
public partial class DataClassesDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  #endregion
	
	public DataClassesDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["BCTestConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public DataClassesDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public DataClassesDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public DataClassesDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public DataClassesDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<Lot> Lots
	{
		get
		{
			return this.GetTable<Lot>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Lots")]
public partial class Lot
{
	
	private System.Nullable<decimal> _Lot_Number;
	
	private System.Nullable<decimal> _xcoordinate;
	
	private System.Nullable<decimal> _ycoordinate;
	
	private bool _availability;
	
	public Lot()
	{
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Name="[Lot Number]", Storage="_Lot_Number", DbType="Decimal(18,0)")]
	public System.Nullable<decimal> Lot_Number
	{
		get
		{
			return this._Lot_Number;
		}
		set
		{
			if ((this._Lot_Number != value))
			{
				this._Lot_Number = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_xcoordinate", DbType="Decimal(18,0)")]
	public System.Nullable<decimal> xcoordinate
	{
		get
		{
			return this._xcoordinate;
		}
		set
		{
			if ((this._xcoordinate != value))
			{
				this._xcoordinate = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ycoordinate", DbType="Decimal(18,0)")]
	public System.Nullable<decimal> ycoordinate
	{
		get
		{
			return this._ycoordinate;
		}
		set
		{
			if ((this._ycoordinate != value))
			{
				this._ycoordinate = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_availability", DbType="Bit NOT NULL")]
	public bool availability
	{
		get
		{
			return this._availability;
		}
		set
		{
			if ((this._availability != value))
			{
				this._availability = value;
			}
		}
	}
}
#pragma warning restore 1591