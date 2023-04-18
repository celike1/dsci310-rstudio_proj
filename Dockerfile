FROM rocker/rstudio:4.1.3

# RUN  Rscript -e "install.packages('cowsay', repos='http://cran.us.r-project.org')"


WORKDIR /home/rstudio

RUN pwd

COPY --chown=rstudio:rstudio renv.lock .
COPY --chown=rstudio:rstudio renv renv
COPY --chown=rstudio:rstudio .Rprofile .

RUN ls -alh

USER rstudio
RUN Rscript -e "renv :: repair()"
USER root