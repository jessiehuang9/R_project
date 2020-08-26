library(RTseries)
##Read the data
```{r}
Air_Passengers <- read.csv(file.choose(), header = T)
```

##Time Series Plot
```{r}
Air_Passengers.ts <- ts(Air_Passengers$Passenger.Count, frequency=12, start= c(2007,2))
Air_Passengers.tsd <- tsd(Air_Passengers.ts, data.title='Air traffic passengers from 2007 February to 2015 October',
                          response.units='Passengers', time.units='Year')
plot(Air_Passengers.tsd, xlab="Year", ylab="Passengers")
```
airesti<-esti(Air_Passengers.tsd,model=model.pdq(d=1,p=12,q=1,D=1,period = 12))
airtran<-iden(Air_Passengers.tsd,gamma=1)
airtranlog<-iden(Air_Passengers.tsd,gamma=0)
airtranroot<-iden(Air_Passengers.tsd,gamma=0.5)
airtrantri<-iden(Air_Passengers.tsd,gamma=0.333)
airesti_1<-esti(Air_Passengers.tsd,model=model.pdq(d=1,p=2,q=2,D=1,period = 12))
airesti_3<-esti(Air_Passengers.tsd,model=model.pdq(d=1,p=0,q=0,Q=1,P=1,D=1,period = 12))
airesti_2<-esti(Air_Passengers.tsd,model=model.pdq(d=1,p=1,q=1,Q=0,P=0,D=1,period = 12))