#################### Source till andra filer #################

# Paket och andra globala inställningar till appen
source("paket.R")
source("graf_funktioner.R")
source("kort_funktioner.R")
source("server_funktioner.R")


produktion <- read_excel("data.xlsx", sheet="produktion")
kulturarv <- read_excel("data.xlsx", sheet="kulturarv")
samtal <- read_excel("data.xlsx", sheet="samtal")
barn_total <- read_excel("data.xlsx", sheet="barn_total")
barn_kommun <- read_excel("data.xlsx", sheet="barn_kommun")
barn_subvention <- read_excel("data.xlsx", sheet="barn_subventioner")
deltagande_total <- read_excel("data.xlsx", sheet="deltagande_total")
deltagande_kommun <- read_excel("data.xlsx", sheet="deltagande_kommun")

############## Tema för appen ##################
my_theme <- bs_theme(
  version = 5,  # Bootstrap 5
  bootswatch = "minty",  # Basstil som kan anpassas ytterligare
  primary = "#00495D",  # Huvudfärg (matchar grafernas huvudfärg)
  secondary = "#20AC6C",  # Sekundärfärg för accenter
  success = "#82CD9E",  # Gröna framgångsindikatorer
  info = "#28B2C5",  # Blå accenter
  warning = "#FDC75F",  # Gula varningar
  danger = "#ED6A55",  # Röda felmeddelanden
  base_font = font_google("Roboto Slab"),  # Primär font
  heading_font = font_google("Roboto Slab"),  # Rubrikfont
  code_font = font_google("Roboto Mono"),  # Font för kod (om relevant)
  bg = "white",  # Ljus bakgrund för appen
  fg = "#001B22",  # Mörk text för kontrast
  font_scale = 1.1  # Lätt förstoring av typsnitt
)

############### UI #########################
link_strategi <- tags$a(
  "Hallands kulturstrategi 2025 - 2032",
  href = "https://www.regionhalland.se/kultur/kulturstrategi-och-samverkan/hallands-kulturstrategi-och-kulturplan",
  target = "_blank"
)
link_plan <- tags$a(
  "Hallands kulturplan",
  href = "https://www.regionhalland.se/kultur/kulturstrategi-och-samverkan/hallands-kulturstrategi-och-kulturplan",
  target = "_blank"
)

link_rapport <- tags$a(
  "Rapport: Kulturanalys Halland",
  href = "https://regionhalland.quarto.pub/kultur/",
  target = "_blank"
)

ui <- page_navbar(
  theme = my_theme,
  title = "Region Hallands stöd till kulturlivet",
  huvudkort_fritt(),
  huvudkort_tillgänglighet(),
  huvudkort_samhällskraft(),
  kort_om_rapporten,
  nav_spacer(),
  nav_menu(title=div(style = "float: left;", tags$img(src = "logo.svg", height = "40px")),
           align="right",
           nav_item(link_strategi),
           nav_item(link_plan),
           nav_item(link_rapport)))
  

## Server ## ----
server <- function(input, output, session){
  
  ## Produktion
  skapa_graf(id="produktion",
             data=produktion,
             output=output,
             input=input,
             download_filename = "produktion",
             graph_function = skapa_stapeldiagram)
  
  ## Kulturarv
  skapa_kulturarvsgraf(id="kulturarv",
             data=kulturarv,
             output=output,
             input=input,
             graph_function = skapa_kulturarvs_diagram,
             download_filename = "kulturarv",
             title="Kulturarv",
             subtitle="Antal besökare på kulturarvsverksamheter")
  
  ## Samtal
  skapa_graf(id="samtal",
             data=samtal,
             output=output,
             input=input,
             graph_function = skapa_stapeldiagram,
             download_filename = "samtal",
             title="Offentliga samtal per huvudsakligt kulturområde",
             subtitle="Antal genomförda seminarier, föreläsningar m.m.")
  
  ## Deltagande total
  skapa_graf_deltagande_total(id="deltagande_total",
                              output=output,
                              input=input,
                              data = deltagande_total,
                              title="Antal deltagare i kulturaktiviteter",
                              graph_function = graf_deltagande_totalt,
                              download_filename = "deltagande_totalt")
  
  ## Deltagande kommun
  skapa_graf_deltagande_kommun(id="deltagande_kommun",
                              output=output,
                              input=input,
                              data = deltagande_kommun,
                              title="Antal deltagare i kulturaktiviteter per kommun",
                              graph_function = graf_deltagande_kommun,
                              download_filename = "deltagande_kommun")
  
  ## Barn total
  skapa_graf_deltagande_total(id="barn_total",
                        output=output,
                        input=input,
                        data = barn_total,
                        title="Antal barn som deltagit i kulturaktiviteter",
                        graph_function = graf_deltagande_totalt,
                        download_filename = "barn_totalt")
  
  ## Barn kommun
  skapa_graf_deltagande_kommun(id="barn_kommun",
                        output=output,
                        input=input,
                        data = barn_kommun,
                        graph_function = graf_deltagande_kommun,
                        download_filename = "barn_kommun")
  
  ## Barn subvention
  skapa_graf_barn_subvention(id="barn_subvention",
                             output=output,
                             input=input,
                             data=barn_subvention,
                             graph_function=graf_barn_subvention,
                             download_filename = "barn_subvention")

}


# Run the application 
shinyApp(ui = ui, server = server)


