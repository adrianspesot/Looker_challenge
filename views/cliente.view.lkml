# The name of this view in Looker is "Cliente"
view: cliente {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_academy.Cliente` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "ID Cliente" in Explore.

  dimension: id_cliente {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID_cliente ;;
  }

  dimension: nombre_cliente {
    type: string
    sql: ${TABLE}.Nombre_cliente ;;
  }

  dimension: segmento {
    type: string
    sql: ${TABLE}.Segmento ;;
  }
  measure: count {
    type: count
  }
}
