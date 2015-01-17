###########################################################################
#                                                                         #
#           Marijuana arrest rate by black population share               #
#                   Coded in R by Scarlett Swerdlow                       #
#                        For the Chicago Sun-Times                        #
#                       scarlett.swerdlow@gmail.com                       #
#                                                                         #
###########################################################################

# Load relevant packages and data

library( foreign )
library( ggplot2 )
library( Hmisc )

Arrests <- read.csv("Arrests.csv" )


# Tests correlation between arrest rate and black population share.

rcorr( Arrests$Pre_arrest_rate, Arrests$Black_share, type = c( "pearson" ) )


# Tests correlation between arrest rate and black population share;
# not sensitive to linear specification.

rcorr( Arrests$Pre_arrest_rate, Arrests$Black_share, type = c( "spearman" ) )


# Creates scatter plot with best fit line from
# Ordinary Least Squares estimation.

ggplot( Arrests, aes( x = Pre_arrest_rate , y = Black_share ) ) +
  geom_point( shape = 1, size = 2, color = "#666667" ) +
  geom_smooth( method = "lm", se = FALSE, size = 1, color = "#22aae9" ) +
  ylim(0, 1) +
  labs( title = "Relationship between arrest rate and race in Chicago communities") +
  xlab( "Marijuana arrests per 100,000 residents" ) +
  ylab( "Share of population that is black" ) +
  theme( text = element_text( size = 20 ) )


