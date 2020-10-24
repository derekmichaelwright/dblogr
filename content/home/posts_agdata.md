+++
# A Projects section created with the Portfolio widget.
widget = "portfolio"  # See https://sourcethemes.com/academic/docs/page-builder/
headless = true  # This file represents a page section.
active = true  # Activate this widget? true/false
weight = 25  # Order that this section will appear.

title = "[agData](posts_agdata)"
subtitle = "An `R` package containing agricultural data sets"

[content]
  # Page type to display. E.g. project.
  page_type = "posts_agdata"
  
  # Filter toolbar (optional).
  # Add or remove as many filters (`[[content.filter_button]]` instances) as you like.
  # To show all items, set `tag` to "*".
  # To filter by a specific tag, set `tag` to an existing tag name.
  # To remove toolbar, delete/comment all instances of `[[content.filter_button]]` below.
  
  # Default filter index (e.g. 0 corresponds to the first `[[filter_button]]` instance below).
  filter_default = 1
  
  [[content.filter_button]]
    name = "All"
    tag = "*"
    
  [[content.filter_button]]
    name = "Featured"
    tag = "Featured"
  
  [[content.filter_button]]
    name = "Introduction"
    tag = "Introduction"
    
  [[content.filter_button]]
    name = "Regions"
    tag = "Regions"
    
  [[content.filter_button]]
    name = "GE Crops"
    tag = "GE Crops"
    
  [[content.filter_button]]
    name = "Fertilizers"
    tag = "Fertilizers"
    
  [[content.filter_button]]
    name = "Cotton"
    tag = "Cotton"
  
  [[content.filter_button]]
    name = "Hemp"
    tag = "Hemp"
    
  [[content.filter_button]]
    name = "Honeybee"
    tag = "Honeybee"
    
  [[content.filter_button]]
    name = "Lentil"
    tag = "Lentil"
    
  [[content.filter_button]]
    name = "Livestock"
    tag = "Livestock"
  
  [[content.filter_button]]
    name = "Maize"
    tag = "Maize"
    
  [[content.filter_button]]
    name = "Potato"
    tag = "Potato"
    
  [[content.filter_button]]
    name = "Rapeseed"
    tag = "Rapeseed"
    
  [[content.filter_button]]
    name = "Soybean"
    tag = "Soybean"
    
  [[content.filter_button]]
    name = "Wheat"
    tag = "Wheat"

[design]
  # Choose how many columns the section has. Valid values: 1 or 2.
  columns = "1"

  # Toggle between the various page layout types.
  #   1 = List
  #   2 = Compact
  #   3 = Card
  #   5 = Showcase
  view = 3

  # For Showcase view, flip alternate rows?
  flip_alt_rows = false

[design.background]
  # Apply a background color, gradient, or image.
  #   Uncomment (by removing `#`) an option to apply it.
  #   Choose a light or dark text color by setting `text_color_light`.
  #   Any HTML color name or Hex value is valid.
  
  # Background color.
  # color = "navy"
  
  # Background gradient.
  # gradient_start = "DeepSkyBlue"
  # gradient_end = "SkyBlue"
  
  # Background image.
  # image = "background.jpg"  # Name of image in `static/img/`.
  # image_darken = 0.6  # Darken the image? Range 0-1 where 0 is transparent and 1 is opaque.

  # Text color (true=light or false=dark).
  # text_color_light = true  
  
[advanced]
 # Custom CSS. 
 css_style = ""
 
 # CSS class.
 css_class = ""
+++

<center>

`devtools::install_github("derekmichaelwright/agData")`

[<i class="fa fa-code"></i> github](http://github.com/derekmichaelwright/agData/) |
[<i class="fa fa-home"></i> derekmichaelwright.github.io/agData/](http://derekmichaelwright.github.io/agData/)

</center>
