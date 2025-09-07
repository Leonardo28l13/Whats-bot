#!/bin/sh

# PASSO 1: Garante que todas as ferramentas necessárias estão instaladas e atualizadas
echo "Verificando e atualizando dependências..."
pkg update && pkg upgrade -y
pkg install -y coreutils curl jq unzip wget git nodejs-lts python
npm install -g semver

# PASSO 2: Busca a tag da versão mais recente no GitHub
echo "Buscando a versão mais recente do bot..."
CURRENT_VERSION=$(curl --silent "https://api.github.com/repos/Leonardo28l13/lbot-whatsapp/releases/latest" | jq -r .tag_name)

# Verifica se a versão foi encontrada
if [ -z "$CURRENT_VERSION" ]; then
    echo "ERRO: Não foi possível encontrar a versão mais recente. Verifique sua conexão com a internet ou o repositório."
    exit 1
fi

echo "Versão mais recente encontrada: $CURRENT_VERSION"

# PASSO 3: Baixa o arquivo .zip da nova versão
echo "Baixando a nova versão... (Isso pode levar alguns minutos)"
# O arquivo será salvo como 'update.zip' na sua pasta principal
wget "https://github.com/Leonardo28l13/lbot-whatsapp/releases/download/$CURRENT_VERSION/LBOT-$CURRENT_VERSION.zip" -O ~/update.zip

# PASSO 4: Prepara as pastas para a atualização
echo "Preparando para aplicar a atualização..."
# Cria uma pasta temporária para extrair os novos arquivos
rm -rf ~/update_temp
mkdir ~/update_temp

# PASSO 5: Extrai os novos arquivos para a pasta temporária
echo "Extraindo arquivos da atualização..."
unzip -o ~/update.zip -d ~/update_temp

# PASSO 6: Copia os arquivos novos por cima dos antigos (O SEGREDO ESTÁ AQUI!)
# Este comando substitui os arquivos de código, mas não toca em arquivos que não existem na atualização (como seu banco de dados)
echo "Substituindo os arquivos antigos pelos novos..."
cp -a ~/update_temp/* ~/LBOT/

# PASSO 7: Limpa os arquivos temporários
echo "Realizando limpeza dos arquivos temporários..."
rm -rf ~/update_temp
rm ~/update.zip

echo "----------------------------------------------------"
echo "ATUALIZAÇÃO CONCLUÍDA COM SUCESSO!"
echo "Seu bot foi atualizado para a versão $CURRENT_VERSION sem perder os dados."
echo "Inicie o bot novamente para aplicar as mudanças."
echo "----------------------------------------------------"
