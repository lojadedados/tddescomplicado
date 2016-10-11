
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shinydashboard)

dashboardPage(
  skin="green",
  dashboardHeader(title = "Previdência Inteligente"),
  dashboardSidebar(
    sidebarMenu(
    menuItem("Tesouro Direto Pre Fixado", tabName = "prefixado", icon = icon("dashboard"),
    collapsible = 
    menuSubItem("Tesouro Direto IPCA", tabName = "IPCA", icon = icon("dashboard")),
    menuSubItem("Tesouro Direto Selic", tabName = "Selic", icon = icon("dashboard")),
    menuSubItem("Tesouro Direto IGPM", tabName = "IGPM", icon = icon("dashboard"))
    ) # fim do menu item
    ) # fim do 
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "prefixado",
              h2("1")),
      # Second tab content
      tabItem(tabName = "IPCA",
              h2("2")),
      tabItem(tabName = "Selic",
              h2("3")),
      tabItem(tabName = "IGPM",
              h2("4"))
      
            
      ) # Fim do tab items
  ) #Fim do body
) # Fim dashboardPage
