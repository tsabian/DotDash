# Makefile para o projeto DotDash
#
# Comandos disponíveis:
#  - make (ou make setup): Configura o projeto (xcodegen + restore swiftpackage).
#  - make generate: Gera o .xcodeproj com xcodegen.
#  - make variables: Resolve as variaveis do .env e substitui no arquivo project.yml.
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

# Pipeline completo: instala ferramentas e configura o projeto
pipeline: install_tools setup

# Instala as ferramentas necessárias (swiftlint, swiftformat, xcodegen)
install_tools:
	@echo "🔧 Instalando ferramentas necessárias..."
	@brew install swiftlint swiftformat xcodegen xcbeautify
	@echo "✅ Ferramentas instaladas com sucesso."

# Configura o projeto (gera o projeto e resolve as dependências)
setup: generate
	@echo "✅ Projeto configurado com sucesso."

# Gera o .xcodeproj com xcodegen
generate:
	@echo "📄 Gerando o projeto Xcode com xcodegen..."
	@$(XCODEGEN)

# Substitui as variaveis do project.yml pelas do .env
variables:
	@echo "🔧 Substituindo variáveis do .env no project.yml..."
	@if [ -f .env ]; then \
	  export $(grep -v '^#' .env | xargs); \
	  envsubst < project.yml > project_temp.yml; \
	  mv project_temp.yml project.yml; \
	  echo "✅ Variáveis substituídas com sucesso."; \
	else \
	  echo "⚠️ Arquivo .env não encontrado. Pulando substituição de variáveis."; \
	fi

# Limpa os arquivos gerados
clean:
	@echo "🧹 Limpando arquivos gerados..."
	@rm -rf $(PROJECT_NAME).xcodeproj
	@rm -rf $(PROJECT_NAME).xcworkspace
	@rm -rf .build
	@rm -rf .swiftpm
	@echo "✅ Limpeza concluída."

# Limpa e reconfigura o projeto do zero
reset: clean setup
	@echo "🔄 Projeto resetado com sucesso."
