# Visão geral

* App em dark mode com foco em **prática de transmissão/recepção**, **tradução** e **treino progressivo**.
* Trabalha com **texto ↔ Morse**, **áudio (mic) → texto**, e **saídas multimodais**: som, vibração e lanterna.
* Totalmente offline, sem contas. Permissões só para microfone/lanterna quando usadas.

---

# Abas e telas

## 1) Praticar (tela principal do mock)

![Layout](/Assets/home.png)

**Objetivo:** transmitir e decodificar Morse rapidamente.

1. **Chave (keyer) no botão central**

   * Toque curto = “·” (dit), toque longo = “–” (dah) com limiar configurável.
   * Feedback: tom lateral (sidetone), animação do botão, **háptica** opcional.
   * Modos de chave: **manual simples**, **iâmbico A/B** (opcional em futuro), **espelhado** para canhotos.

2. **Controles de áudio**

   * **Frequência** do tom (ex.: 300–1000 Hz, default 600 Hz).
   * **PAM (WPM)**: 5–40+.
   * **Farnsworth** (espaçamentos mais longos mantendo PAM de caracteres), slider separado.

3. **Tradução em tempo real**

   * Campo “Tradução de texto” mostra o que foi **transmitido** (do botão) ou **ditado** (via mic) em:

     * **Morse bruto** (· – /) e **texto alfabético** lado a lado (alternar com gesto/toque).
   * Ações rápidas: **Copiar**, **Limpar**, **Reproduzir** (tocar novamente o Morse), **Compartilhar**.

4. **Entrada por texto**

   * Teclado padrão para digitar texto e o app **gera** o Morse (som + visual + lanterna/háptica se ativadas).

5. **Decodificação por microfone**

   * Botão **mic** (mostrado no topo do mock).
   * Pipeline: filtro passa-banda, detecção de tom, AGC, **auto-calibração** de limiar, “noise gate”.
   * Mostra indicador de qualidade do sinal (SNR) e taxa de confiança por caractere.

6. **Modo Lanterna / Sinal luminoso**

   * Alterna saída do tom para **flash** da câmera alinhado ao Morse (útil para prática visual/SOS).

7. **Sessões e estatísticas**

   * Contagem de erros, PAM efetivo, tempo ativo, precisão de decodificação.
   * Histórico simples por sessão (local).

---

## 2) Aprender

![Layout](/Assets/aprender.png)

**Objetivo:** didática progressiva para quem está começando.

1. **Alfabeto + Números + Pontuação**

   * Lista interativa: tocar uma letra toca o **som** e mostra **· –**.
   * Fichas/flashcards com “ouvir → responder”.

2. **Método Koch (treino incremental)**

   * Começa com 2 caracteres em **velocidade alvo** (ex.: 20 PAM com Farnsworth).
   * Adiciona novos caracteres quando usuário atinge **90% de acerto**.

3. **Exercícios**

   * **Ditado**: app toca palavras/caracteres conforme PAM e o usuário transcreve.
   * **Eco**: usuário repete no botão o que ouviu; mede sincronismo e duração.
   * **Quiz**: múltipla escolha por som.
   * Pré-sets: SOS, sinais Q, abreviações comuns.

---

## 3) Ajustes

![Layout](/Assets/ajustes.png)

Show! Aqui vai a descrição clara de cada item da **sessão Ajustes** — o que faz, quando usar e o impacto no app.

# Áudio

* **Frequência (Hz)**
  Define o tom do sidetone ao transmitir/escutar Morse. Faixa típica: **300–1000 Hz** (padrão ~**600 Hz**).
  *Dica:* escolha a faixa onde sua audição percebe melhor o contraste com ruído.

* **Volume do tom lateral**
  Ajusta o volume do sidetone independente do volume do sistema.

* **PAM (WPM)**
  Velocidade-alvo em **palavras por minuto**. Afeta a geração de áudio e o modo de treino.
  *Obs.:* a decodificação automática tenta acompanhar, mas funciona melhor próximo da sua configuração.

* **Farnsworth**
  Mantém os **caracteres** rápidos (ex.: 20 WPM), mas **aumenta os espaços** entre letras/palavras para facilitar a leitura. Ideal para iniciantes.

* **Forma de onda** *(Seno / Quadrada / Desligado)*
  Timbre do tom. **Seno** é mais suave e menos cansativo; **Quadrada** é mais “cortante” e fácil de detectar em ruído. “Desligado” usa padrão.

* **Envelope (Ataque/Decay)**
  Aplica fade-in/fade-out curtinhos para **eliminar cliques** no início/fim dos tons.
  *Recomendado:* ataque e decay de 5–10 ms.

---

# Entrada / Decodificador

* **Sensibilidade do microfone**
  Ganho de entrada do detector. Aumente em ambientes muito silenciosos; reduza em locais barulhentos para evitar falsos positivos.

* **Limiar dit/dah** *(Ligado/Config.)*
  Define a **fronteira de duração** (em unidades de tempo) que separa **dit (·)** de **dah (–)** ao usar o botão/entrada manual.
  *Ajuste fino* ajuda se seus toques tendem a sair mais longos/curtos que o padrão.

* **Noise Gate**
  Ignora sinais **abaixo de um nível** mínimo. Útil para cortar ruído de fundo do microfone ou sopros do ambiente.
  *Se o decoder “começar” letras, reduza o gate; se decodificar ruído, aumente.*

* *(Opcional, se habilitado)* **Auto-calibração**
  Mede o tom e o nível do ambiente por alguns segundos e ajusta sensibilidade/limiares automaticamente.

---

# Saídas

* **Hápticos**
  Vibração acompanhando pontos e traços. Bom para prática silenciosa ou acessibilidade.
  *Sugestão:* deixe ligado em treino, desligue em transmissão longa para poupar bateria.

* **Lanterna**
  Converte a saída em **flash luminoso** (LED) sincronizado com o Morse. Excelente para sinalização visual / SOS.

* **Atalho rápido para SOS**
  Habilita um botão/gesto para **tocar “· · · – – – · · ·”** imediatamente via som + luz (e háptico se ativo), mesmo com a tela bloqueada (dentro dos limites do iOS).

---

# Interface

* **Tema** *(Automático / Claro / Escuro)*
  Segue o sistema (padrão) ou força um tema. O design foi otimizado para **Dark Mode**.

* **Modo canhoto/destro**
  Espelha a posição do **keyer** e controles para conforto de uso.

* **Tamanho de fonte**
  Integra com **Tamanhos Dinâmicos** (Acessibilidade). Amplia labels de Morse e módulos.

* **Idioma da UI**
  PT-BR/EN sem alterar o **alfabeto** e as regras de tempo do Morse (ITU).

---

# Dados & Privacidade

* **Histórico & Estatísticas**
  Limpa sessões, acertos do método Koch e métricas de prática armazenadas localmente.

* **Permissões**
  Atalhos para (des)autorizar **Microfone** e **Câmera/Flash** com explicações inline.

* **Backup/Sincronização (opcional)**
  iCloud para preferências e progresso (se ativado em roadmap).

---

## Presets recomendados (atalhos rápidos)

* **Iniciante silencioso:** 600 Hz, 15 WPM + Farnsworth, Hápticos ON, Lanterna OFF, Gate médio.
* **Prática auditiva:** 600–700 Hz, 20 WPM + Farnsworth leve, Envelope ON, Gate baixo.
* **Ambiente ruidoso:** 700–800 Hz, Gate alto, Forma de onda **Quadrada**.

Se quiser, eu adiciono esses presets na tela de Ajustes e salvo tudo em `UserDefaults` com um botão “Restaurar padrão”. Quer?

---

# Extras úteis (iOS)

* **Frameworks**: `AVAudioEngine`/`AVAudioSession` (tom/decodificação), `CoreHaptics`, `Torch` via `AVCaptureDevice`, `Speech` (opcional se um dia decodificar fala/nomes), `StoreKit` (se tiver Pro).
* **Atalhos da Siri / App Intents**: “Tocar SOS”, “Iniciar treino Koch”, “Decodificar pelo microfone”.
* **Acessibilidade**: rótulos VoiceOver (“dit”, “dah”), tamanhos dinâmicos, alto contraste, feedback háptico como apoio para pessoas com baixa audição.
* **Share Sheet**: exportar texto, áudio (WAV do Morse gerado) e **GIF de pontos/traços** (legal para ensinar).

---

# MVP vs. Próximas (roadmap)

**MVP**

* Botão keyer + sidetone
* Sliders Frequência / PAM / Farnsworth
* Tradução texto↔Morse
* Mic com decodificador básico + calibração
* Lanterna/haptics
* Koch com 2–10 primeiras letras
* Estatísticas simples

**Próximas**

* Keyer iâmbico A/B
* Treinos avançados (palavras do dia, listas custom)
* Pacotes de som (timbres), presets por rádio amador
* Sincronizar presets via iCloud
* Live Activity/Widget: “tocando agora” com PAM

---

# Regras de conversão e limites (implementação)

* **Padrão ITU** para tempos:

  * dit = 1u, dah = 3u, intra-caractere = 1u, entre letras = 3u, entre palavras = 7u (Farnsworth ajusta espaços).
* **Conjunto suportado**: A–Z, 0–9, pontuação básica (.,?/-=+@), prosigns (AR, SK) como opção.
* **Resolução temporal**: ≥ 120 Hz para medir pressões; áudio a 44.1 kHz.
* **Persistência**: `UserDefaults` para preferências; sessões recentes em arquivo local.

---

Se quiser, já te entrego um **protótipo em SwiftUI** dessa tela “Praticar” (com sliders, keyer, lanterna e áudio) ou um **arquivo Figma** com esses componentes. Qual você prefere começar—código SwiftUI ou arte no Figma?
