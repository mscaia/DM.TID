# Création d'une matrice des effectifs
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
colnames(effectifs) <- c("15-29", "30-39", "40-49", "50-59", "60+", "60+")

# Noms des lignes (combinaison sexe et catégorie socioprofessionnelle)
rownames(effectifs) <- c("Femmes_Agriculteurs", "Femmes_Artisans", "Femmes_Cadres", 
                         "Femmes_Professions_inter", "Femmes_Employes", "Femmes_Ouvriers",
                         "Hommes_Agriculteurs", "Hommes_Artisans", "Hommes_Cadres", 
                         "Hommes_Professions_inter", "Hommes_Employes", "Hommes_Ouvriers")
tableau <- effectifs / sum(effectifs)  # Normalisation

# H(A)
age_effectif <- colSums(tableau)
H.A <- sum(-age_effectif * log2(age_effectif))

# H(S)
femmes_effectif <- sum(rowSums(tableau[1:6,]))
hommes_effectif <- sum(rowSums(tableau[7:12,]))
sexe_effectif <- c(femmes_effectif, hommes_effectif)
H.S <- sum(-sexe_effectif * log2(sexe_effectif))

# H(C)
categorie_effectif <- list(
  Agriculteurs = sum(rowSums(tableau[c(1, 7), ])),       # Agriculteurs (Femmes + Hommes)
  Artisans = sum(rowSums(tableau[c(2, 8), ])),           # Artisans (Femmes + Hommes)
  Cadres = sum(rowSums(tableau[c(3, 9), ])),             # Cadres (Femmes + Hommes)
  Professions_inter = sum(rowSums(tableau[c(4, 10), ])), # Professions intermédiaires (Femmes + Hommes)
  Employes = sum(rowSums(tableau[c(5, 11), ])),          # Employés (Femmes + Hommes)
  Ouvriers = sum(rowSums(tableau[c(6, 12), ]))           # Ouvriers (Femmes + Hommes)
)
H.C <- sum(-sapply(categorie_effectif, function(x) x * log2(x)))

# H(A,S)
age_sexe <- c(age_effectif, sexe_effectif)
H.A.S <- sum(-age_sexe * log2(age_sexe))

# H(A,C)
H.A.C <- 0
for (i in 1:length(categorie_effectif)){
  H.A.C <- H.A.C + sum(-colSums(tableau[c(i, i+6),]) * log2(colSums(tableau[c(i, i+6),])))
}

# H(S,C)
femmes_catesociop <- rowSums(tableau[1:6,])
hommes_catesociop <- rowSums(tableau[7:12,])
sexe_catesociop <- list(femmes_catesociop, hommes_catesociop)
H.S.C <- sum(-sapply(sexe_catesociop, function(x) x * log2(x)))

# H(A,S,C)
H.A.S.C <- sum(-tableau * log2(tableau))

# Affichage des résultats
cat("H(A) =", H.A, "\n")
cat("H(S) =", H.S, "\n")
cat("H(C) =", H.C, "\n")
cat("H(A,S) =", H.A.S, "\n")
cat("H(A,C) =", H.A.C, "\n")
cat("H(S,C) =", H.S.C, "\n")
cat("H(A,S,C) =", H.A.S.C, "\n")

I.A.S <- H.A + H.S - H.A.S
I.A.C <- H.A + H.C - H.A.C
I.S.C <- H.S + H.C - H.S.C
