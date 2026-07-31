#  ------------------------------------------------------------------------
#
# Title : tables & figure s Likert  avec refus de répondre
#    By : phM
#  Date : 2026-07-31
#
#  ------------------------------------------------------------------------


# Création tables et figures Likert avec refus de répondre
tt <- tibble(rows = 100)
for (i in 1:20) {
  aa <- runif(100, 1, 11) |>
    round() |>
    as.factor() |>
    fct_recode(
      "TB" = "1",
      "TB" = "2",
      "B" = "3",
      "B" = "4",
      "P" = "5",
      "P" = "6",
      "M" = "7",
      "M" = "8",
      "TM" = "9",
      "TM" = "10",
      "Refuse de répondre" = "11"
    )
  print(head(aa))
  tt <- cbind(tt, aa)
}
tt <- tt[, -1]
names(tt) <- paste0("Q", 1:20)


# Table
exp <- FALSE
nnp <- c(2, 7, 8, 12)
nnn <- c(1, 3, 4, 5, 6)

tabnf <- function(x) {
  tt |>
    dplyr::select(x) |>
    pivot_longer(cols = everything(), names_to = "Fruit", values_to = "Note") |>
    tbl_summary(
      by = "Fruit",
      percent = "column",
      missing = "no"
    ) |>
    bold_labels() |>
    add_ci() |>
    modify_header(label ~ " ") |>
    pexptabph(exp = FALSE, nomfich = "test.ods", nomsheet = "1", lg = TRUE)
}

tabln <- function(x) {
  tt |>
    dplyr::select(x) |>
    mutate(across(everything(), ~ as.numeric(.x))) |>
    tbl_summary(
      type = everything() ~ "continuous",
      missing = "no"
    ) |>
    bold_labels() |>
    modify_header(label ~ " ") |>
    pexptabph(
      exp = FALSE, nomfich = "test.ods",
      nomsheet = "2", lg = TRUE
    )
}

figl <- function(x) {
  gglikert_side(tt |> dplyr::select(x),
    side_values = "NSP",
    add_labels = TRUE,
    reverse_likert = TRUE,
    symmetric = TRUE,
    width = 1
  ) +
    theme(
      legend.text = element_text(size = 8),
      legend.position = "top",
      axis.text.x = element_blank()
    )
}
