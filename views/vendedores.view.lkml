# The name of this view in Looker is "Vendedores"
view: vendedores {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_academy.Vendedores` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Region" in Explore.

  dimension: region {
    primary_key: yes
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: vendedor {
    type: string
    sql: ${TABLE}.Vendedor ;;
  }
  measure: count {
    type: count
  }
}
