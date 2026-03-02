#### Texter ----

text_produktion <- HTML("Indikatorn visat antalet nya produktioner (uruppföranden eller tillfälliga utställningar) som skapas med stöd från Region Halland. Produktioner som satts upp tidigare, exempelvis produktioner från föregående år eller turnerande produktioner, ingår inte i statistiken. Det gör att exempelvis musikområdet ser ut att ha få produktioner trots att Halland har en stark musikscen.")

text_samtal <- HTML("Hallands kulturstrategi lyfter vikten av det offentliga samtalet och kulturen som demokratisk arena. Den här indikatorn mäter därför antalet föredrag, seminarier, föreläsningar och publika samtal som genomförts under året. I kategorin Övrigt ingår konstområdesöverskridande verksamheter samt Region Hallands subventioner för barn och unga. I kulturdatabasen ställs inte frågan om antalet offentliga samtal till musik- och teaterverksamheter. Dessa områden ingår därför inte i statistiken.<br><br>
                    Kulturområden som har större institutioner har fler samtal än andra kulturområden. Bild- och formområdet och kulturarvet är områden med större institutioner, medan film- och slöjdområdena i huvudsak utgörs av mindre institutioner.")

text_kulturarv <- HTML("I kulturstrategin är Hallands händelserika historia en viktig prioritering. Denna indikator följer därför upp antalet besökare på kulturarvsverksamheter. Statistiken delas upp i tre kategorier: verksamheter inom kultursamverkansmodellen (Hallands kulturhistoriska museum, Rian Designmuseum och Arkiv Halland), besök på hembygdsgårdar, samt besök hos verksamheter med andra verksamhetsstöd (Hallands militärhistoriska, Tjolöholms slott, Världsarvet Grimeton, Bonadsmuseet och Mjellby konstmuseum). Statistiken visar det totala deltagandet och inte antal unika detagare. En person kan därför förekomma flera gånger i statistiken.")

text_deltagande_total <- HTML("Denna indikator mäter antalet deltagare i olika kulturaktiviteter. Kulturarvsområdet når flest personer, vilket förklaras av att museum har möjlighet att ta in många personer och har relativt generösa öppettider. Detta går att jämföra med exempelvis en slöjdworkshop, som kan ta emot ett begränsat antal deltagare under en begränsad tid.<br><br>

Vid val av kommun synliggörs antal deltagare i respektive kommun. Nivåerna påverkas mycket av var större institutioner är lokaliserade. Exempelvis har många deltagit i kulturarvsaktiviteter i Varberg där Hallands kulturhistoriska museum ligger. Viktigt att notera är att statistiken utgår från i vilken kommun personerna mött kulturen och inte var de är folkbokförda. Statistiken visar det totala deltagandet och inte antal unika detagare. En person kan därför förekomma flera gånger i statistiken.")

text_deltagande_kommun <- HTML("Denna indikator mäter antal deltagare i kulturaktiviteter per kommun. Du kan välja att visa antalet personer i absoluta tal, eller i förhållande till det totala antalet invånare i kommunen. Observera att syftet med det sistnämnda måttet är att kunna göra mer rättvisa jämförelser mellan kommunerna, men att det inte ska tolkas som hur stor andel av invånarna i respektive kommun som deltagit i kulturaktiviteter. Statistiken utgår nämligen från i vilken kommun deltagarna mött kulturen, och inte var de är folkbokförda. Viktigt att notera är också att statistiken visar det totala deltagandet och inte antal unika detagare. En person kan därför förekomma flera gånger i statistiken.<br><br>
                         Resultatet påverkas mycket av var större insitutioner är lokaliserade. Exempelvis har Varberg ett högt deltagande, vilket beror på att både Hallands kulturhistoriska museum och Teater Halland har sina huvudsakliga lokaler i kommunen.")



text_barn_total <- HTML("Denna indikator mäter antalet barn som deltagit i olika kulturaktiviteter. Kulturarvsområdet når flest personer i målgruppen, vilket förklaras av att museum har möjlighet att ta in många personer och har relativt generösa öppettider. Detta går att jämföra med exempelvis en slöjdworkshop, som kan ta emot ett begränsat antal barn under en begränsad tid.<br><br>

Vid val av kommun synliggörs antal barn som deltagit i kultur i respektive kommun. Nivåerna påverkas mycket av var större institutioner är lokaliserade. Exempelvis har många barn har deltagit i kulturarvsaktiviteter i Varberg där Hallands kulturhistoriska museum ligger. Viktigt att notera är att statistiken utgår från i vilken kommun barnen mött kulturen och inte var de är folkbokförda. Statistiken visar det totala deltagandet och inte antal unika detagare. En person kan därför förekomma flera gånger i statistiken.")

text_barn_kommun <- HTML("Denna indikator mäter hur många barn som deltagit i kulturaktiviteter per kommun. Du kan välja att visa antalet personer i absoluta tal, eller i förhållande till det totala antalet barn i kommunen. Observera att syftet med det sistnämnda måttet är att kunna göra mer rättvisa jämförelser mellan kommunerna, men att det inte ska tolkas som hur stor andel av barnen i respektive kommun som deltagit i kulturaktiviteter. Statistiken utgår nämligen från i vilken kommun barnen mött kulturen, och inte var de är folkbokförda. Viktigt att notera är också att statistiken visar det totala deltagandet och inte antal unika detagare. En person kan därför förekomma flera gånger i statistiken.<br><br>
                         Resultatet påverkas mycket av var större insitutioner är lokaliserade. Exempelvis har Varberg ett högt deltagande, vilket beror på att både Hallands kulturhistoriska museum och Teater Halland har sina huvudsakliga lokaler i kommunen.")

text_barn_subvention <- HTML("Varje år ger Region Halland stöd till kommuner och andra arrangörer som genomför utvalda kulturprogram för barn och unga i åldern 3–19 år. Pengarna ska bidra till att barn och unga får möjlighet till ett rikt kulturliv med upplevelser och eget skapande, både i skolan och på fritiden. Subventionerna fördelas mellan kommunerna utifrån antalet barn 3–19 år och kräver en medfinansiering om 50 %.<br><br>
                             Indikatorn visar antalet barn i respektive kommun som tagit del av det subventionerade utbudet. Du kan välja att visa antalet personer i absoluta tal, eller i förhållande till antalet folkbokförda barn i kommunen. Observera att detta inte är all kultur som erbjuds barnen i kommunen. Kommunerna genomför även andra aktiviteter som inte finns med i denna statistik. Denna indikator visar enbart hur subventionerna har tagits emot.
                             <span style='display:inline;'>Läs mer om subventionerna här: <a href='https://www.regionhalland.se/kultur/kultur-for-barn-och-unga/bokning-av-kulturprogram/subventioner' style='display:inline; text-decoration:underline;'>Subventioner | Region Halland.</a></span>")
#### Om rapporten ----

kort_om_rapporten <- nav_panel(title="Om rapporten",
                              card(HTML("Region Halland fördelar kulturstöd till kulturinstitutioner, kommuner, stiftelser, föreningar, företag och kulturskapare för att de tillsammans ska kunna skapa och erbjuda ett mångsidigt kulturutbud i hela Halland.
                                    <br><br>
                                    Uppföljning av stöden sker på olika sätt. I denna sammanställning utgår vi från uppföljning av:
                                    <br><br>
                                    1. verksamheter som får stöd inom ramen för kultursamverkansmodellen,<br>
                                    2. verksamheter av regionalt intresse, identifierade i samråd med kommunerna i Halland,<br>
                                    3. verksamheter som får treårigt verksamhetsstöd (statistik från och med 2024).<br><br>
                                    
                                    Tillgången till statistik påverkar vilka analyser vi kan göra. Denna uppföljning tar sin grund i underlag från Kulturdatabasen som följer upp verksamheterna inom kultursamverkansmodellen. Frågorna är konst- och kulturområdesspecifika. Exempelvis ställs frågor kring besök och utställningar för museer och kring föreställningar, konserter och publik för scenkonstområdet. Region Halland har valt att använda vissa av frågorna från kulturdatabasen i uppföljningen av de andra verksamheterna för att få en bättre helhetsbild. Region Halland fördelar dock fler stöd än de ovan men en avvägning har gjorts avseende mängden kvantitativ uppföljning i förhållande till stödets storlek.<br><br>
                                    
                                    <span style='display:inline;'>Verksamheterna har olika uppdrag, vilket påverkar den kvantitativa uppföljningen. För en komplett lista på vilka verksamheter som följs upp inom respektive kategori samt deras uppdrag se <a href='https://www.regionhalland.se/kultur/regionalt-kulturstod/organisationer-med-verksamhetsstod' style='display:inline; text-decoration:underline;'>Organisationer med verksamhetsstöd | Region Halland.</a> För att få en heltäckande bild av utvecklingen krävs även en kvalitativ uppföljning. Denna görs genom verksamhetsberättelser och årliga dialoger.</span>
                                        
                                    <span style='display:inline;'>Uppföljningen är utformad utifrån kulturstrategins tre strategiska utvecklingsområden: <b><i>Ett fritt konst- och kulturliv, Engagerande kulturliv för alla</i></b> samt <b><i>Kultur som samhällskraft.</b></i></span>")))
#### Vanligt kort-komponent #### ----
skapa_kort <-  function(titel, id){
  
  nav_panel(title=titel,
            page_sidebar(sidebar = sidebar(
              width = 250,
              div(
                class = "picker-wrapper",
                tags$label(
                  `for` = "year",
                  "Välj år",
                  style = "font-size: 12px; margin-bottom: 4px;"
                ),
                pickerInput(
                  inputId = paste0("selected_year_", id),
                  label = NULL,
                  choices = c(unique(get(id)$År)
                  ),
                  multiple = FALSE,
                  selected = max(get(id)$År),
                  options = list(
                    `style` = "btn-primary",
                    `size` = 10
                  )
                ),      div(
                  class = "info-box",
                  style = "margin-top: 20px; padding: 15px; background-color: #f8f9fa; border-left: 4px solid #00495D; font-size: 12px;",
                  p(
                    "Region Halland stödjer kulturlivet på olika sätt.",
                    style = "margin-bottom: 10px;"
                  ),
                  p(
                    "Det här är en uppföljning av det vi följer upp.",
                    style = "margin-bottom: 0;"
                  )
                ))),layout_column_wrap(fill=FALSE,
                  card(card_header(
                    div(
                      style = "display: flex; justify-content: space-between; align-items: center; width: 100%;",
                      div("Visualisering"),
                      downloadButton(
                        paste0("download_svg_", id),
                        "",
                        icon = icon("download"),
                        class = "btn btn-sm btn-outline-primary",
                        style = "padding: 4px 8px; font-size: 0.8rem;"
                      )
                    )
                  ),
                  card_body(full_screen= FALSE,
                    girafeOutput(height="100%", paste0("plot_", id))
                  )),
                  card(card_header("Förklaring"
                  ),
                  card_body(full_screen= FALSE, "Text"))
                )))
}

#### Ett fritt konst- och kulturliv ----
huvudkort_fritt <- function(){nav_panel("Ett fritt konst- och kulturliv",
                                                navset_tab(
                                                standard_underkort(titel="Produktion", id="produktion", text=text_produktion),
                                                standard_underkort(titel="Det offentliga samtalet", id="samtal", text=text_samtal)))}

standard_underkort <- function(titel, id, text){
  nav_panel(title=titel,
            page_fillable(nav_spacer(),layout_column_wrap(fill=FALSE,
                                        card(card_header(
                                          div(
                                            style = "display: flex; justify-content: space-between; align-items: center; width: 100%;",
                                            div("Visualisering"),
                                            downloadButton(
                                              paste0("download_svg_", id),
                                              "",
                                              icon = icon("download"),
                                              class = "btn btn-sm btn-outline-primary",
                                              style = "padding: 4px 8px; font-size: 0.8rem;"
                                            )
                                          )
                                        ),
                                        
                                        layout_sidebar(full_screen= FALSE,
                                                       sidebar = sidebar(
                                                         width = 250,
                                                         div(
                                                           class = "picker-wrapper",
                                                           tags$label(
                                                             `for` = "year",
                                                             "Välj år",
                                                             style = "font-size: 12px; margin-bottom: 4px;"
                                                           )),
                                                         pickerInput(
                                                           inputId = paste0("selected_year_", id),
                                                           label = NULL,
                                                           choices = c(unique(get(id)$År)),
                                                           multiple = FALSE,
                                                           selected = max(get(id)$År),
                                                           options = list(
                                                             `style` = "btn-primary",
                                                             `size` = 10))),
                                                  girafeOutput(height="100%", paste0("plot_", id))
                                        )),
                                        card(fill=FALSE, card_header("Förklaring"
                                        ),
                                        card_body(full_screen= FALSE, text))
                                        )))
            }

#### Kultur som samhällskraft ----
huvudkort_samhällskraft <- function(){nav_panel("Kultur som samhällskraft",
                                          underkort_kulturarv(id="kulturarv", text = text_kulturarv))}


underkort_kulturarv <- function(id, text){
            page_fillable(layout_column_wrap(fill=FALSE,
                                        card(card_header(
                                          div(
                                            style = "display: flex; justify-content: space-between; align-items: center; width: 100%;",
                                            div("Visualisering"),
                                            downloadButton(
                                              paste0("download_svg_", id),
                                              "",
                                              icon = icon("download"),
                                              class = "btn btn-sm btn-outline-primary",
                                              style = "padding: 4px 8px; font-size: 0.8rem;"
                                            )
                                          )
                                        ),
                                        card_body(full_screen= FALSE,
                                                  girafeOutput(height="100%", paste0("plot_", id))
                                        )),
                                        card(fill=FALSE, card_header("Förklaring"
                                        ),
                                        card_body(full_screen= FALSE, text))
                ))
}


#### Tillgänglighet #### ----
huvudkort_tillgänglighet <- function(){nav_panel("Engagerande kulturliv för alla",
          navset_tab(
            underkort_deltagande_total(titel="Deltagande i kulturaktiviteter", id="deltagande_total", text=text_deltagande_total),
            underkort_deltagande_kommun(titel="Deltagande per kommun", id="deltagande_kommun", text=text_deltagande_kommun),
            underkort_deltagande_total(titel="Deltagande bland barn och unga", id="barn_total", text=text_barn_total),
            underkort_deltagande_kommun(titel="Barn och unga per kommun", id="barn_kommun", text=text_barn_kommun),
            underkort_barn_subvention(titel="Det subventionerade utbudet för barn och unga", id="barn_subvention", text_barn_subvention)))}


underkort_deltagande_total <- function(titel,id, text){
  nav_panel(title=titel,
            nav_spacer(),
            page_fillable(layout_column_wrap(fill=FALSE,
                                          card(card_header(
                                            div(
                                              style = "display: flex; justify-content: space-between; align-items: center; width: 100%;",
                                              div("Visualisering"),
                                              downloadButton(
                                                paste0("download_svg_", id),
                                                "",
                                                icon = icon("download"),
                                                class = "btn btn-sm btn-outline-primary",
                                                style = "padding: 4px 8px; font-size: 0.8rem;"
                                              )
                                            )
                                          ),
                                          layout_sidebar(sidebar = sidebar(
                                            width = 250,
                                            div(
                                              class = "picker-wrapper",
                                              tags$label(
                                                `for` = "year",
                                                "Välj år",
                                                style = "font-size: 12px; margin-bottom: 4px;"
                                              )),
                                            pickerInput(
                                              inputId = paste0("selected_year_", id),
                                              label = NULL,
                                              choices = c(unique(get(id)$År)),
                                              multiple = FALSE,
                                              selected = max(get(id)$År),
                                              options = list(
                                                `style` = "btn-primary",
                                                `size` = 10)),
                                            div(
                                              class = "picker-wrapper",
                                              tags$label(
                                                `for` = "kommun",
                                                "Välj kommun",
                                                style = "font-size: 12px; margin-bottom: 4px;"
                                              )),
                                            pickerInput(
                                              inputId = paste0("selected_kommun_", id),
                                              label = NULL,
                                              choices = c( "Halland",
                                                           "Kungsbacka", 
                                                           "Varberg",
                                                           "Falkenberg",
                                                           "Halmstad",
                                                           "Hylte",
                                                           "Laholm"),
                                              multiple = FALSE,
                                              selected = "Halland",
                                              options = list(
                                                `style` = "btn-primary",
                                                `size` = 10))),
                                            full_screen= FALSE,
                                                    girafeOutput(height="80vh", paste0("plot_", id))
                                          )),
                                          card(fill=FALSE, card_header("Förklaring"
                                          ),
                                          card_body(full_screen= FALSE, text))
                  )))
}

underkort_deltagande_kommun <- function(titel,id, text){
  nav_panel(title=titel,
            nav_spacer(),
            page_fillable(layout_column_wrap(fill=FALSE,
                                        card(card_header(
                                          div(
                                            style = "display: flex; justify-content: space-between; align-items: center; width: 100%;",
                                            div("Visualisering"),
                                            downloadButton(
                                              paste0("download_svg_", id),
                                              "",
                                              icon = icon("download"),
                                              class = "btn btn-sm btn-outline-primary",
                                              style = "padding: 4px 8px; font-size: 0.8rem;"
                                            )
                                          )
                                        ),
                                        layout_sidebar(full_screen= FALSE,
                                                       sidebar = sidebar(
                                                         width = 250,
                                                         div(
                                                           class = "picker-wrapper",
                                                           tags$label(
                                                             `for` = "year",
                                                             "Välj år",
                                                             style = "font-size: 12px; margin-bottom: 4px;"
                                                           )),
                                                         pickerInput(
                                                           inputId = paste0("selected_year_", id),
                                                           label = NULL,
                                                           choices = c(unique(get(id)$År)),
                                                           multiple = FALSE,
                                                           selected = max(get(id)$År),
                                                           options = list(
                                                             `style` = "btn-primary",
                                                             `size` = 10)),
                                                         div(
                                                           class = "picker-wrapper",
                                                           tags$label(
                                                             `for` = "variabel",
                                                             "Välj variabel",
                                                             style = "font-size: 12px; margin-bottom: 4px;"
                                                           )),
                                                         pickerInput(
                                                           inputId = paste0("selected_variabel_", id),
                                                           label = NULL,
                                                           choices = c( "Antal per 100 invånare",
                                                                        "Antal"),
                                                           multiple = FALSE,
                                                           selected = "Antal per 100 invånare",
                                                           options = list(
                                                             `style` = "btn-primary",
                                                             `size` = 10))),
                                                  girafeOutput(height="100%", paste0("plot_", id))
                                        )),
                                        card(fill= FALSE, card_header("Förklaring"
                                        ),
                                        card_body(full_screen= FALSE, text))
                )))
}

underkort_barn_subvention <- function(titel,id, text){
  nav_panel(title=titel,
            nav_spacer(),
            page_fillable(layout_column_wrap(fill=FALSE,
                                        card(card_header(
                                          div(
                                            style = "display: flex; justify-content: space-between; align-items: center; width: 100%;",
                                            div("Visualisering"),
                                            downloadButton(
                                              paste0("download_svg_", id),
                                              "",
                                              icon = icon("download"),
                                              class = "btn btn-sm btn-outline-primary",
                                              style = "padding: 4px 8px; font-size: 0.8rem;"
                                            )
                                          )
                                        ),
                                        layout_sidebar(full_screen= FALSE,
                                                       sidebar = sidebar(
                                                         width = 250,
                                                         div(
                                                           class = "picker-wrapper",
                                                           tags$label(
                                                             `for` = "variabel",
                                                             "Välj variabel",
                                                             style = "font-size: 12px; margin-bottom: 4px;"
                                                           )),
                                                         pickerInput(
                                                           inputId = paste0("selected_variabel_", id),
                                                           label = NULL,
                                                           choices = c( "Antal per 100 invånare",
                                                                        "Antal"),
                                                           multiple = FALSE,
                                                           selected = "Antal per 100 invånare",
                                                           options = list(
                                                             `style` = "btn-primary",
                                                             `size` = 10))),
                                                  girafeOutput(height="100%", paste0("plot_", id))
                                        )),
                                        card(fill=FALSE, card_header("Förklaring"
                                        ),
                                        card_body(full_screen= FALSE, text))
                )))
}

