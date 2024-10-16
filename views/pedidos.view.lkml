# The name of this view in Looker is "Pedidos"
view: pedidos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_academy.Pedidos` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Beneficio" in Explore.

  dimension: beneficio {
    type: number
    sql: ${TABLE}.Beneficio ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_beneficio {
    label: "Beneficios Totales"
    type: sum
    value_format: "$#,##0"
    sql: ${beneficio} ;;  }

  measure: average_beneficio {
    type: average
    sql: ${beneficio} ;;  }

  measure: total_ventas {
    label: "Ventas Totales"
    type: sum
    value_format: "$#,##0"
    sql: ${ventas} ;;
  }

  measure: avg_descuentos{
    label: "Promedio de Descuentos"
    type: average
    value_format: "0.0\%"
    sql: ${descuento};;
  }

  measure: count {
    type: sum
    label: "Cantidades Vendidas"
    sql: ${cantidad} ;;
  }

  measure: margen_beneficio {
    label: "Margen de Beneficio"
    type: number
    value_format: "0\%"
    sql: 100*SUM(${beneficio})/SUM(${ventas}) ;;
  }

  measure: costo_envio_total {
    label: "Costo de Envío Total"
    type: sum
    value_format: "$#,##0"
    sql: ${costo_envio} ;;
  }

  measure: test_metrics {#creo esta métrica para probar a subir en github
    label: "test"
    type: number
    sql: SUM(${beneficio} ;;
  #  filters: [id_mercado: "-NULL"]
  }



  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: costo_envio {
    type: number
    sql: ${TABLE}.Costo_envio ;;
  }

  dimension: descuento {
    type: number
    value_format: "0\%"
    sql: ${TABLE}.Descuento ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha_envio {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_envio ;;
  }

  dimension_group: fecha_pedido {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_pedido ;;
  }

  dimension: id_cliente {
    type: string
    sql: ${TABLE}.ID_cliente ;;
  }

  dimension: id_fila {
    type: number
    sql: ${TABLE}.ID_fila ;;
  }

  dimension: id_mercado {
    type: string
    sql: ${TABLE}.Id_Mercado ;;
  }

  dimension: id_pedido {
    type: string
    sql: ${TABLE}.ID_pedido ;;
  }

  dimension: id_producto {
    type: string
    sql: ${TABLE}.ID_producto ;;
  }

  dimension: modo_envio {
    type: string
    sql: ${TABLE}.Modo_envio ;;
  }

  dimension: prioridad_pedido {
    type: string
    sql: ${TABLE}.Prioridad_pedido ;;
  }

  dimension: ventas {
    type: number
    sql: ${TABLE}.Ventas ;;
  }

  dimension: margen {
    type:  number
    sql:${beneficio} /  ${ventas};;
  }


}
