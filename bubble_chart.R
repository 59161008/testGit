library(dplyr)
library(ggplot2)
library(plotly)
library(ggpubr)
library(RMySQL)

newdata = select(SourceData, Product, SalePrice, Profit)

data = newdata %>%
  group_by(Product) %>%
  count(SalePrice = sum(SalePrice),Profit = sum(Profit)) 

p = plot_ly(data, x = ~SalePrice,y = ~Profit,
            type = 'scatter', mode = 'markers',
            color = ~Product , colors = c('#FFCC99','#FFCC33','#FF3366','#CCFF66','#9933FF'),
            marker = list(size = ~n,line = list(width = 1 , color='#FFFFFF')),
            text = ~paste('Product Name:' ,Product,'<br>SalePrice:',SalePrice,
                          '<br>Profit($):',Profit,'<br>N=',n)) %>%
  layout(title = 'SalePrice and Profit Correlated by Products',
         xaxis = list(showgrid = FALSE, title = 'SalePrice'),
         yaxis = list(showgrid = FALSE, title = 'Profit'),
         showlegend = FALSE)
p
#******************************************buble**********************************************
newdata = select(FeedbackQa, Question1, Question2, Question3,Question4,Question5)
data1 = newdata %>%
  group_by(Question1) %>%
  count(Question1)

data2 = newdata %>%
  group_by(Question2) %>%
  count(Question2)

data3 = newdata %>%
  group_by(Question3) %>%
  count(Question3)

data4 = newdata %>%
  group_by(Question4) %>%
  count(Question4)

data5 = newdata %>%
  group_by(Question5) %>%
  count(Question5)

data = data.frame(q1 = data1$n, q2 = data2$n, q3 = data3$n,  #่join data   country$Country->country คือชื่อตัวแปร , Country คือชื่อคอลัมในชุดข้อมูลที่จะนำมาจอย
                  q4 = data4$n, q5 = data5$n)  #รวมชุดข้อมูล
data = t(data)
point = c("1 point","2 point","3 point","4 point","5 point")
colnames(data)= point
y <- c('The course was effectively<br>organized',
       'The course developed my<br>abilities and skills for<br>the subject',
       'The course developed my<br>ability to think critically about<br>the subject',
       'I would recommend this<br>course to a friend')
x1 <- c(21, 24, 27, 29)
x2 <-c(30, 31, 26, 24)
x3 <- c(21, 19, 23, 15)
x4 <- c(16, 15, 11, 18)
x5 <- c(12, 11, 13, 14)

data <- data.frame(y, x1, x2, x3, x4, x5)

top_labels <- c('Strongly<br>agree', 'Agree', 'Neutral', 'Disagree', 'Strongly<br>disagree')

p <- plot_ly(data, x = ~x1, y = ~y, type = 'bar', orientation = 'h',
             marker = list(color = 'rgba(38, 24, 74, 0.8)',
                           line = list(color = 'rgb(248, 248, 249)', width = 1))) %>%
  add_trace(x = ~x2, marker = list(color = 'rgba(71, 58, 131, 0.8)')) %>%
  add_trace(x = ~x3, marker = list(color = 'rgba(122, 120, 168, 0.8)')) %>%
  add_trace(x = ~x4, marker = list(color = 'rgba(164, 163, 204, 0.85)')) %>%
  add_trace(x = ~x5, marker = list(color = 'rgba(190, 192, 213, 1)')) %>%
  layout(xaxis = list(title = "",
                      showgrid = FALSE,
                      showline = FALSE,
                      showticklabels = FALSE,
                      zeroline = FALSE,
                      domain = c(0.15, 1)),
         yaxis = list(title = "",
                      showgrid = FALSE,
                      showline = FALSE,
                      showticklabels = FALSE,
                      zeroline = FALSE),
         barmode = 'stack',
         paper_bgcolor = 'rgb(248, 248, 255)', plot_bgcolor = 'rgb(248, 248, 255)',
         margin = list(l = 120, r = 10, t = 140, b = 80),
         showlegend = FALSE) %>%
  # labeling the y-axis
  add_annotations(xref = 'paper', yref = 'y', x = 0.14, y = y,
                  xanchor = 'right',
                  text = y,
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(67, 67, 67)'),
                  showarrow = FALSE, align = 'right') %>%
  # labeling the percentages of each bar (x_axis)
  add_annotations(xref = 'x', yref = 'y',
                  x = x1 / 2, y = y,
                  text = paste(data[,"x1"], '%'),
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(248, 248, 255)'),
                  showarrow = FALSE) %>%
  add_annotations(xref = 'x', yref = 'y',
                  x = x1 + x2 / 2, y = y,
                  text = paste(data[,"x2"], '%'),
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(248, 248, 255)'),
                  showarrow = FALSE) %>%
  add_annotations(xref = 'x', yref = 'y',
                  x = x1 + x2 + x3 / 2, y = y,
                  text = paste(data[,"x3"], '%'),
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(248, 248, 255)'),
                  showarrow = FALSE) %>%
  add_annotations(xref = 'x', yref = 'y',
                  x = x1 + x2 + x3 + x4 / 2, y = y,
                  text = paste(data[,"x4"], '%'),
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(248, 248, 255)'),
                  showarrow = FALSE) %>%
  add_annotations(xref = 'x', yref = 'y',
                  x = x1 + x2 + x3 + x4 + x5 / 2, y = y,
                  text = paste(data[,"x5"], '%'),
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(248, 248, 255)'),
                  showarrow = FALSE) %>%
  # labeling the first Likert scale (on the top)
  add_annotations(xref = 'x', yref = 'paper',
                  x = c(21 / 2, 21 + 30 / 2, 21 + 30 + 21 / 2, 21 + 30 + 21 + 16 / 2,
                        21 + 30 + 21 + 16 + 12 / 2),
                  y = 1.15,
                  text = top_labels,
                  font = list(family = 'Arial', size = 12,
                              color = 'rgb(67, 67, 67)'),
                  showarrow = FALSE)
p
