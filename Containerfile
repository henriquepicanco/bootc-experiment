# Obtém a imagem
FROM quay.io/fedora/fedora-bootc:latest

# Atualiza o sistema
RUN dnf -y update

# Instala os repositórios do RPMFusion
RUN dnf -y install \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instalar o driver da NVIDIA
RUN dnf -y install akmod-nvidia

# Instalar programas
COPY packagelist /tmp/
RUN dnf -y install $(< /tmp/packagelist)

# Limpar tudo
RUN dnf clean all
