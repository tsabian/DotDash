# Makefile para o projeto DotDash
#
# Comandos disponíveis:
#  - make (ou make setup): Configura o projeto (xcodegen + restore swiftpackage).
#  - make generate: Gera o .xcodeproj com xcodegen.
#  - make packages: Instala as dependências do Swiftpackage.
#  - make clean: Limpa os arquivos gerados.
#  - make reset: Limpa e reconfigura o projeto do zero.
#
# Autor: Gemini Code Assist
# Data: 2024-06-27	

# Variáveis
PROJECT_NAME := DotDash
XCODEGEN := xcodegen
SWIFTPACKAGE := swift package resolve

# Phony targets para evitar conflitos com nomes de arquivos
.PHONY: all setup generate packages clean reset

# Target padrão (executado com 'make')
all: setup

# Configura o projeto (gera o projeto e resolve as dependências)
setup: generate packages
	@echo "✅ Projeto configurado com sucesso."

# Gera o .xcodeproj com xcodegen
generate:
	@echo "📄 Gerando o projeto Xcode com xcodegen..."
	@$(XCODEGEN)

# Instala as dependências do Swift Package Manager
packages:
	@echo "📦 Resolvendo dependências do Swift Package..."
	@$(SWIFTPACKAGE)

# Limpa os arquivos gerados
clean:
	@echo "🧹 Limpando arquivos gerados..."
	@rm -rf $(PROJECT_NAME).xcodeproj
	@rm -rf .build
	@echo "✅ Limpeza concluída."

# Limpa e reconfigura o projeto do zero
reset: clean setup
	@echo "🔄 Projeto resetado com sucesso."
