library(shiny)
library(zoo)

#sMainDir="C:/Users/Dorinth van Dijk/Documents/MIT/Liquidity_paper_cre"  #main directory
sMainDir="G:/EBO/ECMO/VanDijk/Apps/BeraCruyff"  #main directory

setwd(sMainDir)

# Data pre-processing ----
mData=read.csv("cruyff_bera_test_data.csv",sep=";")

mData=as.matrix(mData)
vRandom=round(runif(100,0,1))
iCounter=1


#  ------------------------------------------------------------------------
# Define UI for app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Supply and demand indices"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
  
      checkboxInput("berra", "Yogi Berra", FALSE),
      checkboxInput("cruyff", "Johan Cruyff", FALSE),
      actionButton("goButton", "Go!")
      
    ),
    
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("quote")),
      h3(textOutput("choice")),
      textOutput("count")


      
  
    )
    
    
  )
)



# Define server logic to plot ----
server <- function(input, output) {

  output$quote <- renderText({
    print(vRandom[counter$countervalue])
    sQuote=mData[1,vRandom[counter$countervalue]+1]
    sQuote
  })
  
  

  counter <- reactiveValues(countervalue = 0) # Defining & initializing the reactiveValues object
  
  observeEvent(input$goButton, {
    counter$countervalue <- counter$countervalue + 1     # if the add button is clicked, increment the value by 1 and update it
    
  })

  output$count <- renderText({
    
    paste("Counter Value is ", counter$countervalue)   # print the latest value stored in the reactiveValues object
    
  })
  
  observeEvent(input$goButton,{ 
   output$choice <- renderText({
      input$goButton
      sPrint=paste0("HALLOJ")
      if(input$berra==TRUE){sPrint=paste0(sPrint," YOGI")}
      if(input$cruyff==TRUE){sPrint=paste0(sPrint," JOHAN")}
      sPrint
    })
  })
  
}


shinyApp(ui, server)


