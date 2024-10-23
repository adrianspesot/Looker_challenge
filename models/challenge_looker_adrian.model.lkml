# Define the database connection to be used for this model.
connection: "looker-challenge"

# include all the views
include: "/views/**/cliente.view.lkml"
include: "/views/**/devoluciones.view.lkml"
include: "/views/**/mercado.view.lkml"
include: "/views/**/pedidos.view.lkml"
include: "/views/**/producto.view.lkml"
include: "/views/**/vendedores.view.lkml"


# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: challenge_looker_adrian_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: challenge_looker_adrian_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Challenge Looker Adrian"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

#explore: paso_er {}


explore: pedidos {
  join: cliente{
    type: left_outer
    relationship: many_to_one
    sql_on: ${cliente.id_cliente}=${pedidos.id_cliente} ;;
  }

  join: devoluciones{
    type: left_outer
    relationship: many_to_one
    sql_on: ${devoluciones.id_pedido}=${pedidos.id_pedido} ;;
  }

  join: mercado{
    type: left_outer
    relationship: many_to_one
    sql_on: ${mercado.id_mercado}=${pedidos.id_mercado} ;;
  }

  join: vendedores{
    type: left_outer
    relationship: many_to_one
    sql_on: ${vendedores.region}=${mercado.region} ;;
  }

  join: producto{
    type: left_outer
    relationship: many_to_one
    sql_on: ${producto.id_producto}=${pedidos.id_producto} ;;
  }

}
