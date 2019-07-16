require("rstudioapi")
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

#Erdos
mydata <- read.table(paste(getwd(), "/datasets/directed/3/erdos.txt", sep=""))
colnames(mydata) <- as.character(unlist(mydata[1,]))
mydata = mydata[-1,]

Dev = as.numeric(factor(mydata$mean)) - as.numeric(factor(mydata$occurences))
NumNodes = factor(mydata$num_nodes, levels=c("100", "200", "500", "1000", "2000", "5000", "10000", "20000"))
P = factor(mydata$erdos_p)

boxplot(Dev ~ NumNodes,
        main = "Erdos - difference per # of nodes",
        xlab = "Number of nodes in the network",
        ylab = "Absolute difference")

boxplot(Dev ~ P,
        main = "Erdos - difference per probability p",
        xlab = "Probability p",
        ylab = "Absolute difference")

#Barabasi
mydata <- read.table(paste(getwd(), "/datasets/directed/3/barabasi.txt", sep=""))
colnames(mydata) <- as.character(unlist(mydata[1,]))
mydata = mydata[-1,]

Dev = as.numeric(factor(mydata$mean)) - as.numeric(factor(mydata$occurences))
NumNodes = factor(mydata$num_nodes, levels=c("200", "500", "1000", "5000", "10000", "20000"))
P = factor(mydata$barabasi_degree)

boxplot(Dev ~ NumNodes,
        main = "Barabasi - difference per # of nodes",
        xlab = "Number of nodes in the network",
        ylab = "Absolute difference")

boxplot(Dev ~ P,
        main = "Barabasi - difference per degree d",
        xlab = "Degree d",
        ylab = "Absolute difference")

#ForestFire
mydata <- read.table(paste(getwd(), "/datasets/directed/3/forestfire.txt", sep=""))
colnames(mydata) <- as.character(unlist(mydata[1,]))
mydata = mydata[-1,]

Dev = as.numeric(factor(mydata$mean)) - as.numeric(factor(mydata$occurences))
NumNodes = factor(mydata$num_nodes, levels=c("200", "500", "1000", "5000", "10000", "20000"))
P = factor(mydata$forward_burning_p)

mydata

boxplot(Dev ~ NumNodes,
        main = "Forest Fire - difference per # of nodes",
        xlab = "Number of nodes in the network",
        ylab = "Absolute difference")

boxplot(Dev ~ P,
        main = "Forest Fire - difference per forward burning probability p",
        xlab = "Forward Burning Probability p",
        ylab = "Absolute difference")
