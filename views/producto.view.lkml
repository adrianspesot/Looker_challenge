# The name of this view in Looker is "Producto"
view: producto {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_academy.Producto` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Categoria" in Explore.

  dimension: categoria {
    type: string
    sql: ${TABLE}.Categoria ;;
  }

  dimension: id_producto {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID_producto ;;
  }

  dimension: nombre_producto {
    type: string
    sql: ${TABLE}.Nombre_producto ;;
  }

  dimension: subcategoria {
    type: string
    sql: ${TABLE}.Subcategoria ;;
  }
  measure: count {
    type: count
  }
}
