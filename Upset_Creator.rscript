require(ggplot2); require(plyr); require(gridExtra); require(grid); require(UpSetR);
require(readxl)

gf_df <- read_excel("C:/Users/maxsi/OneDrive/Desktop/4bc/GenFusions_clean.xlsx")
str(gf_df)

# 1 Direct DF didnt work..
# Error in xtfrm.data.frame(x) : cannot xtfrm data frames
upset(gf_df)

# 2 New Subset Df having Overall Col Param from Direct df
gfo <- data.frame(
  FN = gf_df$`#FusionName`,
  FE = gf_df$`Fusion-effect`,
  CT = gf_df$`Broad-Type`,
  KO = gf_df$KinaseKO,
  TSGO = gf_df$TO...12,
  OO = gf_df$OO,
  TFO = gf_df$TO...18,
  NBPO = gf_df$NBPO,
  DrugO = gf_df$DrugO
)

# 3 Didnt Work
upset(gfo,sets = c("KO", "TSGO", "OO", "TFO", "NBPO", "Drugo"),
      order.by = "freq",
      text.scale = 1.2)

# 4 Subset Df worked
upset(gfo,
      order.by = "freq",
      main.bar.color = "#0072B2",
      sets.bar.color = "#009E73"
      text.scale = 1.2)

# 5 Query for FE and CT [exon-exon and lung]

Myfunc <- function(row, FE, CT) {
  data <- (row["FE"] %in% FE) & (row["CT"] > CT)
}

upset(gfo,
      order.by = "freq",
      main.bar.color = "#0072B2",
      sets.bar.color = "#009E73",
      text.scale = 1.2,
      queries = list(list(query = Myfunc,
                                  params = list(c("exon-exon"), "Lung"),
                                  color = "blue", active = T)))
