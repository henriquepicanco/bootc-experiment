# Obtém a imagem
FROM quay.io/fedora/fedora-bootc:latest

# Atualiza o sistema
RUN dnf update -y

# Instala os repositórios do RPMFusion
RUN dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instalar o driver da NVIDIA
RUN dnf install akmod-nvidia -y

# Limpar tudo
RUN dnf clean all
