
mydata <- read.table("C:/Users/Gabriele/Desktop/AEDD-testing/datasets/directed/3/erdos.txt")
colnames(mydata) <- as.character(unlist(mydata[1,]))
mydata = mydata[-1,]

Dev = as.numeric(factor(mydata$mean)) - as.numeric(factor(mydata$occurences))
NumNodes = factor(mydata$num_nodes, levels=c("100", "200", "500", "1000", "2000", "5000", "10000", "20000"))

NumNodes


boxplot(Dev ~ NumNodes,
        main = "Deviation between estimated and real number of occurences",
        xlab = "Number of nodes in the network",
        ylab = "Absolute difference",
        notch = TRUE)
mydata
