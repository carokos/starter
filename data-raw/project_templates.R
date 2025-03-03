## code to prepare project template goes here

# default template
default_project_template <-
  quote(list(
    readme = list(
      template_filename =
        fs::path_package(package = "starter", "project_templates/default_readme.md"),
      filename = "README.md",
      glue = TRUE
    ),
    gitignore = list(
      template_filename =
        fs::path_package(package = "starter", "project_templates/default_gitignore.txt"),
      filename = ".gitignore",
      glue = FALSE
    ),
    rproj = list(
      template_filename =
        fs::path_package(package = "starter", "project_templates/default_rproj.Rproj"),
      filename = stringr::str_glue("{folder_name}.Rproj"),
      glue = FALSE
    ),
    # only add Rprofile if renv was used
    rprofile =
      switch(
        renv,
        list(
          template_filename =
            fs::path_package(package = "starter",
                             "project_templates/default_rprofile.R"),
          filename = stringr::str_glue(".Rprofile"),
          glue = TRUE
        )
      )
  ))
attr(default_project_template, "label") <- "Default Project Template"

# save templates ---------------------------------------------------------------
project_templates <- list()
project_templates[["default"]] <- default_project_template
usethis::use_data(project_templates, overwrite = TRUE, internal = TRUE)
