# Finalização do app DotDash (código Morse)

## Diagnóstico rápido

O projeto já tem:
- Base SwiftUI com navegação por abas (`Aprender`, `Praticar`, `Ajustes`).
- Uma tabela de mapeamento Morse (`A-Z`, `0-9`, pontuação) no módulo Core.
- Testes iniciais de mapeamento e estrutura de testes configurada.

Mas o estado atual ainda é de **protótipo de interface**: ainda não há implementação funcional de keyer, áudio em tempo real, decodificação por microfone, lanterna, persistência e trilhas de aprendizado.

## O que falta para “finalizar” (MVP publicável)

## 1) Motor Morse (prioridade máxima)
- Criar `MorseEngine` no Core para:
  - `encode(text) -> morse`
  - `decode(morse) -> text`
  - normalização de entrada (maiúsculas, espaços, caracteres inválidos)
- Cobrir casos de erro (caracteres não suportados, pontuação incompleta).
- Completar `MorseTable.swift` com API pública usada por App/iOS/watchOS.

## 2) Keyer real (botão ponto/traço)
- Trocar círculo estático por botão pressionável com medição de duração.
- Regras temporais ITU (dit=1u, dah=3u, espaçamentos 1u/3u/7u).
- Conversão em tempo real para:
  - Morse bruto
  - texto traduzido
- Adicionar controles funcionais de WPM + Farnsworth.

## 3) Áudio (transmissão + recepção)
- Gerar sidetone com `AVAudioEngine`.
- Ajustes reais: frequência, volume, envelope.
- Captura por microfone:
  - filtro passa-banda
  - threshold + noise gate
  - detecção de on/off para derivar dit/dah
- UI de status: sinal detectado, confiança e erros de decodificação.

## 4) Saídas multimodais
- Háptica com `CoreHaptics` (dit/dah distintos).
- Lanterna via `AVCaptureDevice.torchMode` sincronizada ao timing Morse.
- Modo SOS de atalho.

## 5) Abas com conteúdo real
- `Aprender`: lições progressivas + quiz básico.
- `Praticar`: sessão com métricas (acerto, WPM efetivo, tempo).
- `Ajustes`: salvar/restaurar preferências com `UserDefaults`.

## 6) Persistência e domínio
- Estruturas de sessão de treino e histórico local.
- Salvar:
  - preferências de áudio/entrada/saída
  - progresso de aprendizado
  - últimas traduções

## 7) Qualidade e release
- Expandir testes:
  - unitários (encode/decode e timing)
  - integração (fluxo keyer->decoder)
  - UI tests (abas e ações principais)
- Acessibilidade:
  - labels/hints consistentes
  - dynamic type
  - contraste
- Permissões com textos claros (`Info.plist` para microfone/câmera).
- Definir checklist de App Store (ícones, screenshots, privacidade, versão).

## Backlog pós-MVP (não bloquear lançamento)
- Keyer iâmbico A/B
- Auto-calibração avançada de ruído
- Exportar áudio/compartilhar sessão
- Sync iCloud
