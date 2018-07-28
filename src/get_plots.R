suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("ggplot2"))
suppressPackageStartupMessages(library("forcats"))
suppressPackageStartupMessages(library("cowplot"))
theme_set(theme_bw())


pie_chart <- function(data, name){
  # Returns a pie chart of the explanatory variable
  #
  # Args:
  #   data: Two column dataframe consisting of the response and explanatory variables.
  #   name: Name of the explanatory variable 
  #
  # Returns:
  #   A bar plot for the given variable.
  if(missing(data)){
    stop('argument "data" is missing, with no default')
  }
  
  if(missing(name)){
    stop('argument "name" is missing, with no default')
  }
  
  if(!is.data.frame(data)){
    stop('data input should be of type data frame')
  }
  
  if(!is.character(name)){
    stop('name input should be of type character')
  }
  
  
  plot_colors <- c("red", "blue4")
  colnames(data) <- c("ax1", "Class")
  n <- n_distinct(data[,1])
  
  p <-  data %>% group_by(ax1) %>%
    summarise(count = n()) %>% arrange(desc(ax1)) %>% 
    mutate(pos = cumsum(count) - count/2) %>% ggplot() +
    geom_bar(aes(x = "",
                 y = count, fill = ax1), alpha = 0.7, color = "black", stat = "identity") +
    geom_text(aes(x="", y=pos, label = count), size=5) +
    xlab(name) + 
    labs(title = paste("Distribution Of" ,name), fill = "", x="", y="Number of people") +
    scale_fill_brewer(palette = "Set1") +
    coord_polar("y", start=0) +
    theme_bw() + theme(plot.title = element_text(hjust = 0.5, size = 16), 
                       axis.text = element_text(size = 12), 
                       axis.title = element_text(size = 14),
                       axis.text.x = element_blank())
  return(p)
}

# proportion_plot <- function(x, i, responses){
#   plot_colors <- c("red", "blue4")
#   colnames(x) <- c("ax1", "Class")
# 
#   #Proportion plots
#   q <- x %>% group_by(ax1) %>% mutate(count = n()) %>%
#     ggplot(aes(fct_reorder(ax1,count, .desc = TRUE))) +
#     geom_bar(aes(y = (..count..)/sum(..count..), fill = Class), position = "fill", color = "black", alpha = 0.7) +
#     xlab(responses[i]) +
#     labs(title = paste("Proportions For" ,responses[i]), y = "Proportion") +
#     scale_fill_manual(values = plot_colors)
#     theme_bw() + theme(plot.title = element_text(hjust = 0.5, size = 12),
#                        axis.text.x = element_text(angle=45, vjust=0.5, size = 12))
#     
#     return(q)
# }


bar_plot <- function(data, name){
  # Returns a bar plot of the explanatory variable.
  #
  # Args:
  #   data: Two column dataframe consisting of the response and explanatory variables.
  #   name: Name of the explanatory variable 
  #
  # Returns:
  #   A bar plot for the given variable.
  if(missing(data)){
    stop('argument "data" is missing, with no default')
  }
  
  if(missing(name)){
    stop('argument "name" is missing, with no default')
  }
  
  if(!is.data.frame(data)){
    stop('data input should be of type data frame')
  }
  
  if(!is.character(name)){
    stop('name input should be of type character')
  }
  
  
  plot_colors <- c("red", "blue4")
  colnames(data) <- c("ax1", "Class")
  
  p <-  data %>% group_by(ax1, Class) %>%
    summarise(count = n()) %>% ggplot() +
    geom_col(aes(x = fct_reorder(ax1,count, .desc = TRUE),
                 y = count, fill = Class), alpha = 0.7, color = "black") +
    xlab("") + 
    labs(title = paste(name), y = "Count") +
    theme_bw() + theme(plot.title = element_text(hjust = 0.5, size = 12),
                       axis.text.x = element_text(angle=45, vjust=0.5, size = 12))
  
  return(p)
}

