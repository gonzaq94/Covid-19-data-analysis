rate_vs_cases_plot <- function(data,countries,populations=list(),title= '',xlabel='',ylabel='') {
  
  #jpeg(paste(title,".jpg"))
  if(length(populations) == 0){
    
    populations = rep(1,length(countries))
  }

    if(length(countries) == 0){
    
    plot(0,type='n',xlab = xlabel,ylab = ylabel,log = 'xy', xlab=xlabel, ylab=ylabel, main = title,
      panel.first = grid(equilogs = FALSE, lty = 6))
    
    return()
  }
  
    for(i in 1:length(countries)){
      
      if (countries[i]=='China') {
        
        new_cases <- subset(data, Country.Region == countries[i] & type == 'confirmed' & Province.State == 'Hubei')
        recovered <- subset(data, Country.Region == countries[i] & type == 'recovered' & Province.State == 'Hubei')
        
      }
      else{
        
        new_cases <- subset(data, Country.Region == countries[i] & type == 'confirmed' & Province.State == '')
        recovered <- subset(data, Country.Region == countries[i] & type == 'recovered' & Province.State == '')
      }
      
      active_cases = new_cases$cumsum-recovered$cumsum
      new_cases = new_cases$cases
      
      if (i==1){
  
        plot(active_cases/as.numeric(populations[i]),
             new_cases/as.numeric(populations[i]),type='l',
             log = 'xy', xlab=xlabel, ylab=ylabel, col=i, main = title,
             panel.first = grid(equilogs = FALSE, lty = 6))

      }
      else{
        lines(active_cases/as.numeric(populations[i]),new_cases/as.numeric(populations[i]),col=i)  
      }
    }
    
  
    legend( x="bottomright", 
            legend=c(countries),
            col=c(1:length(countries)), lwd=1, 
            pch=c(NA,NA))
     #dev.off()
}	

temporal_plot <- function(data,countries,title= '',xlabel='',ylabel='') {
  
  if(length(countries) == 0){
    
    plot(0,type='n',xlab = xlabel,ylab = ylabel)
    
    return()
  }
  
  for(i in 1:length(countries)){
    
    if (countries[i]=='China') {
      
      new_cases <- subset(data, Country.Region == countries[i] & type == 'confirmed' & Province.State == 'Hubei')
      recovered <- subset(data, Country.Region == countries[i] & type == 'recovered' & Province.State == 'Hubei')
      
    }
    else{
      
      new_cases <- subset(data, Country.Region == countries[i] & type == 'confirmed' & Province.State == '')
      recovered <- subset(data, Country.Region == countries[i] & type == 'recovered' & Province.State == '')
    }
    
    active_cases = new_cases$cumsum-recovered$cumsum

    if (i==1){
      
      plot(new_cases$date,active_cases,type='l',
           xlab=xlabel, ylab=ylabel, col=i, main = title,
           panel.first = grid(lty = 6))
      
    }
    else{
      lines(new_cases$date,active_cases,col=i)  
    }
  }
  
  
  legend( x="bottomright", 
          legend=c(countries),
          col=c(1:length(countries)), lwd=1, 
          pch=c(NA,NA))
  #dev.off()
  
}