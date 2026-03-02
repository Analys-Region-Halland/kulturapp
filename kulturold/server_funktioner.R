#### Vanlig graf-komponent  #####
skapa_graf <- function(id, 
                       data,
                       graph_function,
                       output = output,
                       input = input,
                       title = "Produktioner",
                       subtitle = "Antal produktioner med stöd från Region Halland",
                       caption = "Källa: Region Halland",
                       category_variable = "Kulturområde",
                       value_variable = "Värde",
                       download_filename, 
                       y_axis_title = NULL,
                       x_axis_title = NULL){
  
  
  
  # Rendera grafen
  output[[paste0("plot_", id)]] <- renderGirafe({
    
    # Use the dynamic input ID based on the current panel
    year_input_id <- paste0("selected_year_", id)
    
    data <- data |> 
      filter(År == input[[year_input_id]], !!sym(value_variable) >0) |>
      group_by(År, !!sym(category_variable), Variabel) |>
      summarize(!!sym(value_variable) := sum(!!sym(value_variable)), .groups="drop")
    
    plot_params <- list(
      data = data,
      title = title,
      subtitle = subtitle,
      caption = caption,
      y_axis_title = y_axis_title,
      x_axis_title = x_axis_title,
      category_variable = category_variable,
      value_variable = value_variable)
    
    # Anropa graph_type med alla parametrar
    do.call(graph_function, plot_params)
  })
  # Hantera SVG-nedladdning
  output[[paste0("download_svg_", id)]] <- downloadHandler(
    filename = function() {
      paste0(download_filename, "_", format(Sys.Date(), "%Y%m%d"), ".svg")
    },
    content = function(file) {
      
      # Use the dynamic input ID based on the current panel
      year_input_id <- paste0("selected_year_", id)
      
      data <- data |> 
        filter(År == input[[year_input_id]], !!sym(value_variable) >0) |>
        group_by(År, !!sym(category_variable), Variabel) |>
        summarize(!!sym(value_variable) := sum(!!sym(value_variable)), .groups="drop")
      
      plot_params <- list(
        data = data,
        title = title,
        subtitle = subtitle,
        caption = caption,
        y_axis_title = y_axis_title,
        x_axis_title = x_axis_title,
        category_variable = category_variable,
        value_variable = value_variable)
      
      width <- 13.333
      height <- width / 1.618
      
      temp_plot <- do.call(graph_function, plot_params)
      temp_plot$width <- width
      temp_plot$height <- height
      
      girafe_svg <- temp_plot$x$html
      writeLines(girafe_svg, file)
    }
  )
  
}

#### Kulturarv ----

skapa_kulturarvsgraf <-function(id, 
                       data,
                       graph_function = skapa_kulturarvs_diagram,
                       output = output,
                       input = input,
                       title = "Kulturarv",
                       subtitle = "Antal besökare på kulturarvsverksamheter",
                       caption = "Källa: Region Halland",
                       category_variable = "Kulturområde",
                       value_variable = "Värde",
                       download_filename, 
                       y_axis_title = NULL,
                       x_axis_title = NULL){
  
  
  
  # Rendera grafen
  output[[paste0("plot_", id)]] <- renderGirafe({
    
    data <- data |> 
      group_by(År, Kulturområde, Variabel) |>
      summarize(Värde = sum(Värde), .groups="drop") |>
      mutate(År = as.character(År))
    
    
    plot_params <- list(
      data = data,
      title = title,
      subtitle = subtitle,
      caption = caption,
      y_axis_title = y_axis_title,
      x_axis_title = x_axis_title,
      category_variable = category_variable,
      value_variable = value_variable)
    
    # Anropa graph_type med alla parametrar
    do.call(graph_function, plot_params)
  })
  # Hantera SVG-nedladdning
  output[[paste0("download_svg_", id)]] <- downloadHandler(
    filename = function() {
      paste0(download_filename, "_", format(Sys.Date(), "%Y%m%d"), ".svg")
    },
    content = function(file) {
      
    
      data <- data |> 
        group_by(År, Kulturområde, Variabel) |>
        summarize(Värde = sum(Värde), .groups="drop") |>
        mutate(År = as.character(År))
      
      plot_params <- list(
        data = data,
        title = title,
        subtitle = subtitle,
        caption = caption,
        y_axis_title = y_axis_title,
        x_axis_title = x_axis_title,
        category_variable = category_variable,
        value_variable = value_variable)
      
      width <- 13.333
      height <- width / 1.618
      
      temp_plot <- do.call(graph_function, plot_params)
      temp_plot$width <- width
      temp_plot$height <- height
      
      girafe_svg <- temp_plot$x$html
      writeLines(girafe_svg, file)
    }
  )
  
}

#### Barn - total - Graf-komponent ----
skapa_graf_deltagande_total <- function(id, 
                                  data,
                                  graph_function,
                                  output = output,
                                  input = input,
                                  title = "Antal barn som deltagit i kulturaktiviteter",
                                  caption = "Källa: Region Halland",
                                  download_filename, 
                                  y_axis_title = NULL,
                                  x_axis_title = NULL){
  
  
  
  # Rendera grafen
  output[[paste0("plot_", id)]] <- renderGirafe({
    
    # Use the dynamic input ID based on the current panel
    year_input_id <- paste0("selected_year_", id)
    kommun_input_id <- paste0("selected_kommun_", id)
    
    data <- data |> 
      filter(År == input[[year_input_id]], Kommun == input[[kommun_input_id]]) |>
      group_by(År, Kommun, Kulturområde) |>
      summarize(Värde = sum(Värde), .groups="drop")
    
    plot_params <- list(
      data = data,
      title = title,
      caption = caption,
      y_axis_title = y_axis_title,
      x_axis_title = x_axis_title)
    
    # Anropa graph_type med alla parametrar
    do.call(graph_function, plot_params)
  })
  # Hantera SVG-nedladdning
  output[[paste0("download_svg_", id)]] <- downloadHandler(
    filename = function() {
      paste0(download_filename, "_", format(Sys.Date(), "%Y%m%d"), ".svg")
    },
    content = function(file) {
      
      # Use the dynamic input ID based on the current panel
      year_input_id <- paste0("selected_year_", id)
      kommun_input_id <- paste0("selected_kommun_", id)
      
      data <- data |> 
        filter(År == input[[year_input_id]], Kommun == input[[kommun_input_id]]) |>
        group_by(År, Kommun, Kulturområde) |>
        summarize(Värde = sum(Värde), .groups="drop")
      
      plot_params <- list(
        data = data,
        title = title,
        caption = caption,
        y_axis_title = y_axis_title,
        x_axis_title = x_axis_title)
      
      width <- 13.333
      height <- width / 1.618
      
      temp_plot <- do.call(graph_function, plot_params)
      temp_plot$width <- width
      temp_plot$height <- height
      
      girafe_svg <- temp_plot$x$html
      writeLines(girafe_svg, file)
    }
  )
  
}

#### Barn - kommun - Graf-komponent ----
skapa_graf_deltagande_kommun <- function(id, 
                                   data,
                                   graph_function,
                                   output = output,
                                   input = input,
                                   title = "Antal barn som deltagit i kulturaktiviteter per kommun",
                                   caption = "Källa: Region Halland",
                                   download_filename, 
                                   y_axis_title = NULL,
                                   x_axis_title = NULL){
  
  
  
  # Rendera grafen
  output[[paste0("plot_", id)]] <- renderGirafe({
    
    # Use the dynamic input ID based on the current panel
    year_input_id <- paste0("selected_year_", id)
    variabel_input_id <- paste0("selected_variabel_", id)
    
    data <- data |> 
      filter(År == input[[year_input_id]], Variabel == input[[variabel_input_id]])
    
    plot_params <- list(
      data = data,
      title = title,
      caption = caption,
      y_axis_title = y_axis_title,
      x_axis_title = x_axis_title)
    
    # Anropa graph_type med alla parametrar
    do.call(graph_function, plot_params)
  })
  # Hantera SVG-nedladdning
  output[[paste0("download_svg_", id)]] <- downloadHandler(
    filename = function() {
      paste0(download_filename, "_", format(Sys.Date(), "%Y%m%d"), ".svg")
    },
    content = function(file) {
      
      # Use the dynamic input ID based on the current panel
      year_input_id <- paste0("selected_year_", id)
      kommun_input_id <- paste0("selected_kommun_", id)
      
      data <- data |> 
        filter(År == input[[year_input_id]], Variabel == input[[variabel_input_id]])
      
      plot_params <- list(
        data = data,
        title = title,
        caption = caption,
        y_axis_title = y_axis_title,
        x_axis_title = x_axis_title)
      
      width <- 13.333
      height <- width / 1.618
      
      temp_plot <- do.call(graph_function, plot_params)
      temp_plot$width <- width
      temp_plot$height <- height
      
      girafe_svg <- temp_plot$x$html
      writeLines(girafe_svg, file)
    }
  )
  
}

#### Barn - subventionerna - Graf-komponent ----
skapa_graf_barn_subvention <- function(id, 
                                       data,
                                       graph_function,
                                       output = output,
                                       input = input,
                                       title = "Antal barn som deltagit i det subventionerade kulturutbudet",
                                       caption = "Källa: Region Halland",
                                       download_filename, 
                                       y_axis_title = NULL,
                                       x_axis_title = NULL){
  
  
  
  # Rendera grafen
  output[[paste0("plot_", id)]] <- renderGirafe({
    
    # Use the dynamic input ID based on the current panel
    variabel_input_id <- paste0("selected_variabel_", id)
    
    data <- data |> 
      filter(Variabel == input[[variabel_input_id]])
    
    plot_params <- list(
      data = data,
      title = title,
      caption = caption,
      y_axis_title = y_axis_title,
      x_axis_title = x_axis_title)
    
    # Anropa graph_type med alla parametrar
    do.call(graph_function, plot_params)
  })
  # Hantera SVG-nedladdning
  output[[paste0("download_svg_", id)]] <- downloadHandler(
    filename = function() {
      paste0(download_filename, "_", format(Sys.Date(), "%Y%m%d"), ".svg")
    },
    content = function(file) {
      
      # Use the dynamic input ID based on the current panel
      variabel_input_id <- paste0("selected_variabel_", id)
      
      data <- data |> 
        filter(Variabel == input[[variabel_input_id]])
      
      plot_params <- list(
        data = data,
        title = title,
        caption = caption,
        y_axis_title = y_axis_title,
        x_axis_title = x_axis_title)
      
      width <- 13.333
      height <- width / 1.618
      
      temp_plot <- do.call(graph_function, plot_params)
      temp_plot$width <- width
      temp_plot$height <- height
      
      girafe_svg <- temp_plot$x$html
      writeLines(girafe_svg, file)
    }
  )
  
}

