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
.PHONY: all install_tools setup generate clean reset open permissions

# Target padrão (executado com 'make')
all: generate permissions open

# Instala as ferramentas necessárias (swiftlint, swiftformat, xcodegen)
install_tools:
	@echo "🔧 Instalando ferramentas necessárias..."
	@brew install swiftlint swiftformat xcodegen xcbeautify
	@echo "✅ Ferramentas instaladas com sucesso."

# Configura o projeto (gera o projeto e resolve as dependências)
setup: install_tools generate permissions
	@echo "✅ Projeto configurado com sucesso."

# Gera o .xcodeproj com xcodegen
generate:
	@echo "📄 Gerando o projeto Xcode com xcodegen..."
	@$(XCODEGEN)

# set permission 777 to googleservice if exists
permissions:
	@echo "🔒 Ajustando permissões para GoogleService-Info.plist..."
	@if [ -f App/Sources/SupportingFiles/GoogleService-Info.plist ]; then \
		chmod 777 App/Sources/SupportingFiles/GoogleService-Info.plist; \
		echo "🔒 Permissões ajustadas para GoogleService-Info.plist"; \
	else \
		echo "⚠️ GoogleService-Info.plist não encontrado. Pulando ajuste de permissões."; \
	fi

# Limpa os arquivos gerados
clean:
	@echo "🧹 Limpando arquivos gerados..."
	@rm -rf $(PROJECT_NAME).xcodeproj
	@rm -rf $(PROJECT_NAME).xcworkspace
	@rm -rf .build
	@rm -rf build
	@rm -rf .swiftpm
	@echo "✅ Limpeza concluída."

# Limpa e reconfigura o projeto do zero
reset: clean generate open
	@echo "🔄 Projeto resetado com sucesso."

# Abre o projeto no Xcode
open:
	@echo "🚀 Abrindo o projeto no Xcode..."
	@open $(PROJECT_NAME).xcodeproj
