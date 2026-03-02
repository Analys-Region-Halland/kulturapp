#### Standard stapeldiagram #### ----

skapa_stapeldiagram <- function(data,
                                title = "Antal produktioner efter kulturområde",
                                subtitle = "Produktioner med stöd från Region Halland",
                                caption = "Källa: Region Halland",
                                category_variable = "Kulturområde",
                                value_variable = "Värde",
                                y_axis_title = NULL,
                                x_axis_title = NULL){

## I funktionen
title_color <- "#001B22"

plot_data <- data |>
  mutate(tooltip_text = sprintf(
    "<div>
       <strong style='font-size: 14px;'>%s</strong><br>
       <span style='font-size: 12px;'><b>Kulturområde:</b> %s</span><br>
       <span style='font-size: 12px;'><b>År:</b> %s</span><br>
       <span style='font-size: 12px;'><b>Värde:</b> %s</span>
       </div>",
    Variabel,
    Kulturområde,
    År,
    format(Värde, big.mark = " ", scientific = FALSE)))


# Skapa basgraf
p <- ggplot(data=plot_data, aes(x = reorder(!!sym(category_variable), !!sym(value_variable)), y = !!sym(value_variable)))+
  geom_bar_interactive(fill= "#00495D", stat="identity",  aes(tooltip = tooltip_text, data_id = paste0(!!sym(category_variable))))+
  coord_flip()+
  scale_y_continuous(expand=expansion(mult=c(0,0.05)),
                     breaks = pretty_breaks(),
                     labels = scales::label_number(big.mark = " "))+
  labs(
    title = title,
    subtitle = paste0(subtitle, " | ", max(plot_data$År)),
    caption = caption,
    x = x_axis_title,
    y = y_axis_title
  ) +
  theme_minimal() +
  theme(
    plot.background = element_blank(),
    panel.background = element_rect(fill = "white", color = NA),
    panel.grid = element_blank(),
    legend.position = "none",
    plot.title = element_text(
      size = 10, 
      color = title_color, 
      face = "bold",
      family = "Roboto Slab",
      margin = margin(b = 4)
    ),
    plot.subtitle = element_text(
      size = 8, 
      color = "#00495D",
      family = "Roboto Slab",
      margin = margin(b = 4)
    ),
    plot.caption = element_text(
      size = 6,
      color = "#666666",
      family = "Roboto Slab",
      margin = margin(t = 10)
    ),
    axis.text = element_text(
      size = 7,
      color = "#001B22",
      family = "Roboto Slab"
    ),
    axis.title = element_text(
      size = 6.5,
      color = "#666666",
      family = "Roboto Slab"
    ),
    axis.line = element_line(color = "#001B22", size = 0.2),
    axis.ticks = element_line(color = "#001B22", size = 0.2),
    axis.ticks.length = unit(0.1, "cm"),
    plot.margin = margin(1, 1, 1, 1))



girafe(
  ggobj = p,
  width_svg = 5,
  height_svg = 3.5,
  options = list(
    opts_sizing(
      rescale = TRUE,
      width = 1
    ),
    opts_hover(
      css = "
          stroke-width: 2.5;
          fill: #20AC6C;
          cursor: crosshair;
          transition: all 0.2s ease;
        ",
      reactive = FALSE
    ),
    opts_toolbar(saveaspng = FALSE),
    opts_tooltip(
      css = "
          font-size: 16px;
          background: white;
          color: #00495D;
          padding: 12px;
          border-radius: 6px;
          line-height: 1.3;
          font-family: 'Roboto Slab', sans-serif;
          border: 1px solid #00495D;
          box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        "
    ),
    opts_selection(type = "none")
  ),
)

}




#### Kulturarv ----

skapa_kulturarvs_diagram <- function(data,
                                title = "Kulturarv",
                                subtitle = "Antal besökare på kulturarvsverksamheter",
                                caption = "Källa: Region Halland",
                                category_variable = "Kulturområde",
                                value_variable = "Värde",
                                y_axis_title = NULL,
                                x_axis_title = NULL){
  
  ## I funktionen
  title_color <- "#001B22"
  
  plot_data <- data |>
    mutate(tooltip_text = sprintf(
      "<div>
       <strong style='font-size: 14px;'>%s</strong><br>
       <span style='font-size: 12px;'><b>Kulturområde:</b> %s</span><br>
       <span style='font-size: 12px;'><b>År:</b> %s</span><br>
       <span style='font-size: 12px;'><b>Värde:</b> %s</span>
       </div>",
      Variabel,
      Kulturområde,
      År,
      format(Värde, big.mark = " ", scientific = FALSE)))
  
  
  # Skapa basgraf
  p <- ggplot(data=plot_data, aes(x = reorder(!!sym(category_variable), !!sym(value_variable)), y = !!sym(value_variable), fill = År))+
    geom_bar_interactive(stat="identity",  aes(tooltip = tooltip_text, data_id = paste0(!!sym(category_variable), År)), position="dodge")+
    scale_fill_manual(values=c("#00495D", "#20AC6C", "#82CD9E"), guide=guide_legend(reverse=TRUE, title=NULL))+
    coord_flip()+
    scale_y_continuous(expand=expansion(mult=c(0,0.05)),
                       breaks = pretty_breaks(),
                       labels = scales::label_number(big.mark = " "))+
    labs(
      title = title,
      subtitle = paste0(subtitle),
      caption = caption,
      x = x_axis_title,
      y = y_axis_title
    ) +
    theme_minimal() +
    theme(
      plot.background = element_blank(),
      panel.background = element_rect(fill = "white", color = NA),
      panel.grid = element_blank(),
      legend.position = "right",
      legend.text = element_text(
        size = 8, 
        family = "Roboto Slab"),
      plot.title = element_text(
        size = 10, 
        color = title_color, 
        face = "bold",
        family = "Roboto Slab",
        margin = margin(b = 4)
      ),
      plot.subtitle = element_text(
        size = 8, 
        color = "#00495D",
        family = "Roboto Slab",
        margin = margin(b = 4)
      ),
      plot.caption = element_text(
        size = 6,
        color = "#666666",
        family = "Roboto Slab",
        margin = margin(t = 10)
      ),
      axis.text = element_text(
        size = 7,
        color = "#001B22",
        family = "Roboto Slab"
      ),
      axis.title = element_text(
        size = 6.5,
        color = "#666666",
        family = "Roboto Slab"
      ),
      axis.line = element_line(color = "#001B22", size = 0.2),
      axis.ticks = element_line(color = "#001B22", size = 0.2),
      axis.ticks.length = unit(0.1, "cm"),
      plot.margin = margin(1, 1, 1, 1))
  
  
  
  girafe(
    ggobj = p,
    width_svg = 5,
    height_svg = 3.5,
    options = list(
      opts_sizing(
        rescale = TRUE,
        width = 1
      ),
      opts_hover(
        css = "
          stroke-width: 2.5;
          fill: #28B2C5;
          cursor: crosshair;
          transition: all 0.2s ease;
        ",
        reactive = FALSE
      ),
      opts_toolbar(saveaspng = FALSE),
      opts_tooltip(
        css = "
          font-size: 16px;
          background: white;
          color: #00495D;
          padding: 12px;
          border-radius: 6px;
          line-height: 1.3;
          font-family: 'Roboto Slab', sans-serif;
          border: 1px solid #00495D;
          box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        "
      ),
      opts_selection(type = "none")
    ),
  )
  
}

#### Barn- och unga - Stapel totalt ----
graf_deltagande_totalt <- function(data = data,
                             title="Antal deltagande barn i kulturaktiviteter",
                             caption="Källa: Region Halland",
                             x_axis_title = NULL,
                             y_axis_title = NULL){
  
  
  ## I funktionen
  title_color <- "#001B22"
  
  plot_data <- data |>
    mutate(tooltip_text = sprintf(
      "<div>
       <strong style='font-size: 14px;'>Antal deltagare</strong><br>
       <span style='font-size: 12px;'><b>Kulturområde:</b> %s</span><br>
       <span style='font-size: 12px;'><b>År:</b> %s</span><br>
       <span style='font-size: 12px;'><b>Värde:</b> %s</span>
       </div>",
      Kulturområde,
      År,
      format(Värde, big.mark = " ", scientific = FALSE)))
  
  
  # Skapa basgraf
  p <- ggplot(data=plot_data, aes(x = reorder(Kulturområde, Värde), y = Värde))+
    geom_bar_interactive(fill= "#00495D", stat="identity",  aes(tooltip = tooltip_text, data_id = paste0(Kulturområde)))+
    coord_flip()+
    scale_y_continuous(expand=expansion(mult=c(0,0.05)),
                       breaks = pretty_breaks(),
                       labels = scales::label_number(big.mark = " "))+
    labs(
      title = title,
      subtitle = paste0("Per kulturområde | ", last(plot_data$Kommun), " | ", max(plot_data$År)),
      caption = caption,
      x = x_axis_title,
      y = y_axis_title
    ) +
    theme_minimal() +
    theme(
      plot.background = element_blank(),
      panel.background = element_rect(fill = "white", color = NA),
      panel.grid = element_blank(),
      legend.position = "none",
      plot.title = element_text(
        size = 10, 
        color = title_color, 
        face = "bold",
        family = "Roboto Slab",
        margin = margin(b = 4)
      ),
      plot.subtitle = element_text(
        size = 8, 
        color = "#00495D",
        family = "Roboto Slab",
        margin = margin(b = 4)
      ),
      plot.caption = element_text(
        size = 6,
        color = "#666666",
        family = "Roboto Slab",
        margin = margin(t = 10)
      ),
      axis.text = element_text(
        size = 7,
        color = "#001B22",
        family = "Roboto Slab"
      ),
      axis.title = element_text(
        size = 6.5,
        color = "#666666",
        family = "Roboto Slab"
      ),
      axis.line = element_line(color = "#001B22", size = 0.2),
      axis.ticks = element_line(color = "#001B22", size = 0.2),
      axis.ticks.length = unit(0.1, "cm"),
      plot.margin = margin(1, 1, 1, 1))
  
  
  
  girafe(
    ggobj = p,
    width_svg = 5,
    height_svg = 3.5,
    options = list(
      opts_sizing(
        rescale = TRUE,
        width = 1
      ),
      opts_hover(
        css = "
          stroke-width: 2.5;
          fill: #20AC6C;
          cursor: crosshair;
          transition: all 0.2s ease;
        ",
        reactive = FALSE
      ),
      opts_toolbar(saveaspng = FALSE),
      opts_tooltip(
        css = "
          font-size: 16px;
          background: white;
          color: #00495D;
          padding: 12px;
          border-radius: 6px;
          line-height: 1.3;
          font-family: 'Roboto Slab', sans-serif;
          border: 1px solid #00495D;
          box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        "
      ),
      opts_selection(type = "none")
    ),
  )
  
}

#### Deltagare - Kommunerna jämförelse ----
graf_deltagande_kommun <- function(data = data,
                             title="Antal barn som deltagit i kulturaktiviteter per kommun",
                             caption="Källa: Region Halland",
                             x_axis_title = NULL,
                             y_axis_title = NULL){
  
  
  ## I funktionen
  title_color <- "#001B22"
  
  plot_data <- data |>
    mutate(tooltip_text = sprintf(
      "<div>
       <strong style='font-size: 14px;'>Antal deltagare per kommun</strong><br>
       <span style='font-size: 12px;'><b>Geografi:</b> %s</span><br>
       <span style='font-size: 12px;'><b>År:</b> %s</span><br>
       <span style='font-size: 12px;'><b>Variabel:</b> %s</span><br>
       <span style='font-size: 12px;'><b>Värde:</b> %s</span>
       </div>",
      Kommun,
      År,
      Variabel,
      format(Värde, big.mark = " ", scientific = FALSE)))
  
  
  # Skapa basgraf
  p <- ggplot(data=plot_data, aes(x = reorder(Kommun, Värde), y = Värde))+
    geom_bar_interactive(fill= "#00495D", stat="identity",  aes(tooltip = tooltip_text, data_id = Kommun))+
    coord_flip()+
    scale_y_continuous(expand=expansion(mult=c(0,0.05)),
                       breaks = pretty_breaks(),
                       labels = scales::label_number(big.mark = " "))+
    labs(
      title = title,
      subtitle = paste0(last(plot_data$Variabel), " | ", max(plot_data$År)),
      caption = caption,
      x = x_axis_title,
      y = y_axis_title
    ) +
    theme_minimal() +
    theme(
      plot.background = element_blank(),
      panel.background = element_rect(fill = "white", color = NA),
      panel.grid = element_blank(),
      legend.position = "none",
      plot.title = element_text(
        size = 10, 
        color = title_color, 
        face = "bold",
        family = "Roboto Slab",
        margin = margin(b = 4)
      ),
      plot.subtitle = element_text(
        size = 8, 
        color = "#00495D",
        family = "Roboto Slab",
        margin = margin(b = 4)
      ),
      plot.caption = element_text(
        size = 6,
        color = "#666666",
        family = "Roboto Slab",
        margin = margin(t = 10)
      ),
      axis.text = element_text(
        size = 7,
        color = "#001B22",
        family = "Roboto Slab"
      ),
      axis.title = element_text(
        size = 6.5,
        color = "#666666",
        family = "Roboto Slab"
      ),
      axis.line = element_line(color = "#001B22", size = 0.2),
      axis.ticks = element_line(color = "#001B22", size = 0.2),
      axis.ticks.length = unit(0.1, "cm"),
      plot.margin = margin(1, 1, 1, 1))
  
  girafe(
    ggobj = p,
    width_svg = 5,
    height_svg = 3.5,
    options = list(
      opts_sizing(
        rescale = TRUE,
        width = 1
      ),
      opts_hover(
        css = "
          stroke-width: 2.5;
          fill: #20AC6C;
          cursor: crosshair;
          transition: all 0.2s ease;
        ",
        reactive = FALSE
      ),
      opts_toolbar(saveaspng = FALSE),
      opts_tooltip(
        css = "
          font-size: 16px;
          background: white;
          color: #00495D;
          padding: 12px;
          border-radius: 6px;
          line-height: 1.3;
          font-family: 'Roboto Slab', sans-serif;
          border: 1px solid #00495D;
          box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        "
      ),
      opts_selection(type = "none")
    ),
  )
  
}


#### Barn- och unga - Subventionerna ----

graf_barn_subvention <- function(data = data,
                                 title="Antal barn som deltagit i det subventionerade kulturutbudet",
                                 caption="Källa: Region Halland",
                                 color_palette,
                                 x_axis_title = NULL,
                                 y_axis_title = NULL){
  
  
  
  
    main_color <- "#00495D"
    secondary_colors <- c(
      "#20AC6C", "#82CD9E", "#28B2C5", "#A3D8E7", 
      "#ED6A55", "#F29385", "#FDC75F"
    )
    
    unique_groups <- unique(data$Kommun)
    n_groups <- length(unique_groups)
    
    color_palette <- setNames(
      c(main_color, secondary_colors[1:(n_groups-1)]),
      c("Halland", setdiff(unique_groups, "Halland")))

  
  ## I funktionen
  title_color <- "#001B22"
  
  plot_data <- data |>
    mutate(tooltip_text = sprintf(
      "<div>
       <strong style='font-size: 14px;'>Antal deltagande barn per kommun</strong><br>
       <span style='font-size: 12px;'><b>Geografi:</b> %s</span><br>
       <span style='font-size: 12px;'><b>År:</b> %s</span><br>
       <span style='font-size: 12px;'><b>Variabel:</b> %s</span><br>
       <span style='font-size: 12px;'><b>Värde:</b> %s</span>
       </div>",
      Kommun,
      År,
      Variabel,
      format(Värde, big.mark = " ", scientific = FALSE))) |>
    mutate(label = if_else(År == max(År), str_replace(Kommun, " ", "\n"), NA_character_))

  
  # Beräkna axlar och padding
  y_breaks <- pretty(range(plot_data$Värde, na.rm = TRUE), n = 7)
  x_breaks <- pretty(range(plot_data$År, na.rm = TRUE), n = 5)
  x_range <- diff(range(plot_data$År))
  label_padding <- x_range * 0.05
  
  # Skapa basgraf
  p <- ggplot(data=plot_data, aes(x = År, y = Värde, color=Kommun, group=Kommun))+
    geom_line(size=.4)+
    geom_point_interactive(
      aes(
        tooltip = tooltip_text,
        data_id = paste0(Kommun, "_", År)
      ),
      size = 1,
      alpha = 0.7
    ) +
    geom_text_repel(
      aes(label = label),
      family = "Roboto Slab",
      size = 2.5,
      direction = "y",
      xlim = c(max(plot_data$År) + label_padding, NA),
      hjust = 0,
      segment.size = 0.4,
      segment.alpha = 0.8,
      segment.linetype = "dotted",
      box.padding = 0.4,
      segment.curvature = -0.1,
      segment.ncp = 3,
      segment.angle = 20,
      min.segment.length = 0,
      force = 1,
      na.rm = TRUE
    )+
    # Skalor och koordinater
    coord_cartesian(
      clip = "off",
      ylim = range(y_breaks)
    ) +
    scale_x_continuous(
      expand = c(0, 0),
      limits = c(min(plot_data$År, na.rm = TRUE), 
                 max(plot_data$År, na.rm = TRUE) + (diff(range(plot_data$År, na.rm = TRUE)) * 0.25))
    )+
    scale_y_continuous(
      expand = c(0, 0),
      breaks = y_breaks,
      labels = scales::label_number(big.mark = " ")
    ) +
    scale_color_manual(values = color_palette) +
    labs(
      title = title,
      subtitle = paste0(last(plot_data$Variabel), " | 2019 - 2024"),
      caption = caption,
      x = x_axis_title,
      y = y_axis_title
    ) +
    theme_minimal() +
    theme(
      plot.background = element_blank(),
      panel.background = element_rect(fill = "white", color = NA),
      panel.grid = element_blank(),
      legend.position = "none",
      plot.title = element_text(
        size = 10, 
        color = title_color, 
        face = "bold",
        family = "Roboto Slab",
        margin = margin(b = 4)
      ),
      plot.subtitle = element_text(
        size = 8, 
        color = "#00495D",
        family = "Roboto Slab",
        margin = margin(b = 4)
      ),
      plot.caption = element_text(
        size = 6,
        color = "#666666",
        family = "Roboto Slab",
        margin = margin(t = 10)
      ),
      axis.text = element_text(
        size = 7,
        color = "#001B22",
        family = "Roboto Slab"
      ),
      axis.title = element_text(
        size = 6.5,
        color = "#666666",
        family = "Roboto Slab"
      ),
      axis.line = element_line(color = "#001B22", size = 0.2),
      axis.ticks = element_line(color = "#001B22", size = 0.2),
      axis.ticks.length = unit(0.1, "cm"),
      plot.margin = margin(1, 1, 1, 1)
    )
    
  # Skapa girafe-objekt
  girafe(
    ggobj = p,
    width_svg = 5,
    height_svg = 3.5,
    options = list(
      opts_sizing(
        rescale = TRUE,
        width = 1
      ),
      opts_hover(
        css = "
          stroke-width: 2.5;
          r: 3;
          cursor: crosshair;
          transition: all 0.2s ease;
        ",
        reactive = FALSE
      ),
      opts_toolbar(saveaspng = FALSE),
      opts_tooltip(
        css = "
          font-size: 16px;
          background: white;
          color: #00495D;
          padding: 12px;
          border-radius: 6px;
          line-height: 1.3;
          font-family: 'Roboto Slab', sans-serif;
          border: 1px solid #00495D;
          box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        "
      ),
      opts_selection(type = "none")
    ),
  )
  
}
