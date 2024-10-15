
install.packages("infotheo")
library(infotheo)

effectifs <- matrix(c(
  27.8, 189.7, 70.0, 119.6, 187.1, 76.9,  # Femmes - Agriculteurs
  117.4, 914.0, 357.9, 556.1, 525.8, 184.8,  # Femmes - Artisans
  564.9, 2638.5, 1209.0, 1429.5, 1161.6, 360.0,  # Femmes - Cadres
  1353.7, 3735.7, 1840.7, 1895.0, 1507.8, 256.2,  # Femmes - Professions intermédiaires
  1570.9, 3486.4, 1605.6, 1880.9, 1819.6, 397.0,  # Femmes - Employés
  1271.6, 2648.6, 1285.9, 1362.7, 1300.4, 180.5,  # Femmes - Ouvriers
  24.2, 146.0, 56.2, 89.8, 138.0, 43.4,  # Hommes - Agriculteurs
  79.2, 645.6, 258.4, 387.2, 378.7, 128.7,  # Hommes - Artisans
  315.7, 1538.5, 685.3, 853.2, 719.0, 240.1,  # Hommes - Cadres
  613.3, 1750.4, 834.7, 915.7, 755.9, 123.7,  # Hommes - Professions intermédiaires
  476.0, 865.5, 449.5, 416.0, 329.8, 58.3,  # Hommes - Employés
  1085.8, 2133.9, 1068.4, 1065.4, 987.9, 130.1  # Hommes - Ouvriers
), nrow = 12, byrow = TRUE)

# Noms des colonnes (groupes d'âge)
colnames(effectifs) <- c("15-29", "30-49","30-39", "40-49", "50-59", "60+")

# Noms des lignes (combinaison sexe et catégorie socioprofessionnelle)
rownames(effectifs) <- c("Femmes_Agriculteurs", "Femmes_Artisans", "Femmes_Cadres", 
                         "Femmes_Professions_inter", "Femmes_Employes", "Femmes_Ouvriers",
                         "Hommes_Agriculteurs", "Hommes_Artisans", "Hommes_Cadres", 
                         "Hommes_Professions_inter", "Hommes_Employes", "Hommes_Ouvriers")

cat("Le nombre total de personne interogé", sum(effectifs))

tableau <- effectifs/sum(effectifs)  # On met notre tableau sous forme de pourcentage
# 1. Créer les variables pour A, S et C
A <- rep(1:6, each = 12)  # 6 catégories d'âge, répétées pour chaque sexe et catégorie
S <- rep(c("Femme", "Homme"), each = 6, times = 6)  # Sexe
C <- rep(c("Agriculteurs", "Artisans", "Cadres", "Professions_inter", "Employés", "Ouvriers"), times = 12)  # Catégorie socio-professionnelle

# On construit un data frame avec les données
data <- data.frame(A = A, S = S, C = C, Frequency = as.vector(tableau))

# 2. Créer une table de contingence pour chaque paire de variables

# I(C, (A x S))
table_CS <- table(data$C, data$S, data$A)
probs_CS <- prop.table(table_CS)

# 3. Calculer l'information mutuelle I(C, (A x S))
I_C_AS <- 0
for (c in levels(data$C)) {
  for (s in levels(data$S)) {
    for (a in levels(data$A)) {
      p_CSA <- probs_CS[c, s, a]
      if (p_CSA > 0) {
        p_C <- sum(probs_CS[c, , ])
        p_AS <- sum(probs_CS[, s, a])
        I_C_AS <- I_C_AS + p_CSA * log2(p_CSA / (p_C * p_AS))
      }
    }
  }
}

# I(S, (A x C))
table_SA <- table(data$S, data$A, data$C)
probs_SA <- prop.table(table_SA)

I_S_AC <- 0
for (s in levels(data$S)) {
  for (a in levels(data$A)) {
    for (c in levels(data$C)) {
      p_SAC <- probs_SA[s, a, c]
      if (p_SAC > 0) {
        p_S <- sum(probs_SA[s, , ])
        p_AC <- sum(probs_SA[, a, c])
        I_S_AC <- I_S_AC + p_SAC * log2(p_SAC / (p_S * p_AC))
      }
    }
  }
}

# I(A, (C x S))
table_AC <- table(data$A, data$C, data$S)
probs_AC <- prop.table(table_AC)

I_A_CS <- 0
for (a in levels(data$A)) {
  for (c in levels(data$C)) {
    for (s in levels(data$S)) {
      p_ACS <- probs_AC[a, c, s]
      if (p_ACS > 0) {
        p_A <- sum(probs_AC[a, , ])
        p_CS <- sum(probs_AC[, c, s])
        I_A_CS <- I_A_CS + p_ACS * log2(p_ACS / (p_A * p_CS))
      }
    }
  }
}

# Affichage des résultats
cat("I(C, (A x S)) =", I_C_AS, "\n")
cat("I(S, (A x C)) =", I_S_AC, "\n")
cat("I(A, (C x S)) =", I_A_CS, "\n")
