suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("readr"))
suppressPackageStartupMessages(library("ggplot2"))
suppressPackageStartupMessages(library("forcats"))
theme_set(theme_bw())

main <- function() {

#Read the data
responses <- read_csv(file = "docs/survery_responses.csv")

#Path to write the file in
write_path <- "docs"

plot_title <- c(NA, NA, "Academic Background", "Years of Coding Experience", "Attitude Towards Coding", "First Programming Language", "R or Python", "Preferred Data Science Task", "Number of Languages Actively Being Used")

#Plot Bar and Proportion plots for all categorical variables.
for (i in 3:ncol(responses)){
  if(i != 7)  categorical_plots(responses[,c(i,7)], i, plot_title, write_path, colnames(responses[,i]))
}

}



categorical_plots <- function(x, i, responses, write_path, plot_name){
  
  #Function to plot all the categorical variable
  
  plot_colors <- c("red", "blue4")
  
  colnames(x) <- c("ax1", "Class")
  n <- n_distinct(x[,1])
  
  #Bar plot
  p <-  x %>% group_by(ax1, Class) %>%
    summarise(count = n()) %>% ggplot() +
    geom_col(aes(x = fct_reorder(ax1,count, .desc = TRUE),
                 y = count, fill = Class), alpha = 0.7, color = "black") +
    xlab(responses[i]) + 
    labs(title = paste("Bar Plot for" ,responses[i]), y = "Count") +
    scale_fill_manual(values = plot_colors) +
    theme_bw() + theme(plot.title = element_text(hjust = 0.5, size = 16), 
                       axis.text = element_text(size = 12), 
                       axis.title = element_text(size = 14))
  
  #Proportion Plot
  q <- x %>% group_by(ax1) %>% mutate(count = n()) %>%
    ggplot(aes(fct_reorder(ax1,count, .desc = TRUE))) +
    geom_bar(aes(y = (..count..)/sum(..count..), fill = Class), position = "fill", color = "black", alpha = 0.7) +
    xlab(responses[i]) +
    labs(title = paste("Proportions for" ,responses[i]), y = "Proportion") +
    scale_fill_manual(values = plot_colors) +
    theme_bw() + theme(plot.title = element_text(hjust = 0.5, size = 16),
                       axis.text = element_text(size = 12),
                       axis.title = element_text(size = 14))
  
  #Save files
  if(n > 3){
    ggsave(plot = p + coord_flip(),
           filename = paste(plot_name,".png",sep = ""),
           path = write_path)
    
    ggsave(plot = q + coord_flip(),
           filename = paste(plot_name,"_prop.png",sep = ""),
           path = write_path)
  }
  else
  {
    ggsave(plot = p,
           filename = paste(plot_name,".png",sep = ""),
           path = write_path)
    ggsave(plot = q,
           filename = paste(plot_name,"_prop.png",sep = ""),
           path = write_path)
  }
}


# call main function
main()
