\name{StatSmooth}
\alias{stat_smooth}
\alias{StatSmooth}
\title{stat_smooth}
\description{Add a smoother}
\details{
Aids the eye in seeing patterns in the presence of overplotting.This page describes \code{\link{stat_smooth}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with stat_smooth.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{stat_smooth(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
}
}
\usage{stat_smooth(...)}
\arguments{
 \item{...}{other arguments are passed to smoothing function}
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/stat_smooth.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    c <- ggplot(mtcars, aes(y=wt, x=qsec))
    c + stat_smooth() 
    c + stat_smooth() + geom_point()

    # Adjust parameters
    c + stat_smooth(se = FALSE) + geom_point()

    c + stat_smooth(span = 0.9) + geom_point()  
    c + stat_smooth(method = "lm") + geom_point()  
    c + stat_smooth(method = lm, formula= y ~ ns(x,3)) + geom_point()  
    c + stat_smooth(method = rlm, formula= y ~ ns(x,3)) + geom_point()  
    
    # The default confidence band uses a transparent colour. 
    # This currently only works on a limited number of graphics devices 
    # (including Quartz, PDF, and Cairo) so you may need to set the
    # fill colour to a opaque colour, as shown below
    c + stat_smooth(fill="grey50", size=2)
    c + stat_smooth(fill="blue", size=2)
    
    # The colour of the line can be controlled with the colour aesthetic
    c + stat_smooth(fill="blue", colour="darkblue", size=2)
    c + stat_smooth(fill=alpha("blue", 0.2), colour="darkblue", size=2)
    c + geom_point() + stat_smooth(fill=alpha("blue", 0.2), colour="darkblue", size=2)
    
    # Smoothers for subsets
    c <- ggplot(mtcars, aes(y=wt, x=mpg)) + facet_grid(. ~ cyl)
    c + stat_smooth(method=lm) + geom_point() 
    c + stat_smooth(method=lm, fullrange=T) + geom_point() 
    
    # Geoms and stats are automatically split by aesthetics that are factors
    c <- ggplot(mtcars, aes(y=wt, x=mpg, colour=factor(cyl)))
    c + stat_smooth(method=lm) + geom_point() 
    c + stat_smooth(method=lm, fullrange=TRUE, fill=alpha("black", 0.1)) + geom_point() 

    # Use qplot instead
    qplot(qsec, wt, data=mtcars, geom=c("smooth", "point"))
    
    # Example with logistic regression
    data("kyphosis", package="rpart")
    qplot(Age, Kyphosis, data=kyphosis)
    qplot(Age, Kyphosis, data=kyphosis, position="jitter")
    qplot(Age, Kyphosis, data=kyphosis, position=position_jitter(y=5))

    qplot(Age, as.numeric(Kyphosis) - 1, data=kyphosis) + stat_smooth(method="glm", family="binomial")
    qplot(Age, as.numeric(Kyphosis) - 1, data=kyphosis) + stat_smooth(method="glm", family="binomial", fill="grey70")
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}