# DotDash

## Documentação de Produto: App DotDash para iOS

1. Visão Geral do Produto
DotDash é um aplicativo de código Morse para iOS projetado para ser a ferramenta mais completa e amigável do mercado brasileiro. Diferente de concorrentes que focam apenas em aprendizado ou em tradução de texto, o DotDash combina ensino interativo, codificação/decodificação avançada e, como principal diferencial, a captura e interpretação de sinais Morse do mundo real através da câmera e do microfone do iPhone.

Nossa missão é resolver as principais "dores" dos usuários atuais: interfaces poluídas, anúncios excessivos, paywalls agressivos e falta de funcionalidades robustas para uso prático.

2. Público-Alvo
Iniciantes e Estudantes: Pessoas interessadas em aprender código Morse de forma interativa e lúdica.
Entusiastas e Hobbistas: Usuários que já conhecem Morse e buscam uma ferramenta poderosa para praticar, decodificar sinais externos (rádio amador, luzes) e se comunicar.
Profissionais e Escoteiros: Indivíduos que podem precisar do código Morse em situações práticas de comunicação ou sobrevivência.
3. Funcionalidades Principais
As funcionalidades serão divididas em módulos para garantir uma experiência de usuário clara e organizada.

3.1. Módulo de Decodificação (Input)
Decodificador de Áudio em Tempo Real:

Utiliza o microfone para captar sons do ambiente.
Implementa algoritmos de processamento de sinal (como FFT) para filtrar ruídos e isolar o sinal Morse.
Interface visual que mostra o sinal de áudio sendo captado e a tradução em tempo real.
Calibração: Permite ao usuário ajustar a sensibilidade do microfone e o limiar (threshold) de detecção para se adaptar a ambientes barulhentos.
Decodificador Visual em Tempo Real:

Utiliza a câmera para detectar flashes de luz (lanternas, telas, etc.).
Análise de frames de vídeo para identificar mudanças de brilho.
Calibração: Permite ajustar a sensibilidade à luz e a área de detecção na tela.
Feedback visual imediato quando um sinal de luz é detectado.
Decodificador de Texto:

Área de texto para colar ou digitar mensagens em código Morse e traduzi-las para texto plano.
3.2. Módulo de Codificação (Output)
Tradutor Texto ➔ Morse:

Converte texto digitado em código Morse.
Transmissor Interativo (Modo Telégrafo):

Uma interface de "toque" que simula um telégrafo real. O usuário pode tocar para gerar pontos e traços, com o app interpretando e traduzindo o que foi inserido.
Múltiplos Modos de Emissão:

Som: Emite o código Morse como bipes de áudio.
Flash da Câmera: Usa o LED do iPhone para transmitir o código com luz.
Tela: Pisca a tela do dispositivo em branco/preto.
Vibração: Usa o Taptic Engine para uma resposta tátil.
Controle de Velocidade (WPM):

Slider ou seletor para ajustar a velocidade de transmissão em Palavras Por Minuto (WPM), com presets comuns (lento, médio, rápido) e ajuste fino.
3.3. Módulo de Aprendizado
Lições Interativas: Níveis progressivos que ensinam o alfabeto, números e pontuações, letra por letra.
Quizzes e Desafios: Jogos para praticar a recepção (ouvir/ver e identificar a letra) e a transmissão (digitar a letra e o app emite o sinal).
Modo de Prática Livre: Um ambiente para testar livremente a codificação e decodificação.
4. Experiência do Usuário (UX) e Design
Interface Limpa e Moderna: Design minimalista, com foco na usabilidade. Suporte a Dark Mode desde o lançamento.
Feedback Visual Claro: Animações e indicadores que mostram claramente quando um sinal está sendo detectado, transmitido ou traduzido. Por exemplo, um gráfico em tempo real para o sinal de áudio.
Navegação Intuitiva: Menus simples e acesso rápido às funcionalidades principais (Decodificar, Codificar, Aprender).
Acessibilidade: Uso de fontes legíveis, contrastes adequados e, se possível, integração com o VoiceOver.
Permissões Transparentes: O app explicará claramente por que precisa de acesso à câmera e ao microfone, solicitando a permissão apenas quando a funcionalidade for utilizada pela primeira vez.
5. Modelo de Monetização
O objetivo é construir uma base de usuários leal, evitando as frustrações dos concorrentes.

Versão Gratuita (DotDash):

Funcionalidades: Acesso a todas as funcionalidades de decodificação de texto, aprendizado (primeiros níveis), e transmissão por som e tela.
Limitações: A decodificação por áudio e câmera pode ter um limite de tempo diário. A transmissão por flash e vibração pode ser bloqueada. Anúncios não intrusivos (ex: um banner na parte inferior).
Versão Paga (DotDash Pro):

Modelo: Compra única (one-time purchase) para desbloquear tudo permanentemente. Preço competitivo (ex: R$ 14,90 - R$ 29,90).
Benefícios:
Remoção completa de todos os anúncios.
Uso ilimitado dos decodificadores de áudio e câmera.
Desbloqueio dos modos de transmissão por flash e vibração.
Acesso a todos os níveis e desafios do módulo de aprendizado.
Histórico de mensagens traduzidas.
Possíveis temas de interface adicionais.
Este modelo oferece um grande valor na versão gratuita, incentivando o usuário a adotar o app e, caso se torne um entusiasta, a atualização para a versão Pro será uma decisão fácil e de ótimo custo-benefício.

6. Considerações Técnicas (iOS)
Linguagem: Swift.
UI: SwiftUI para uma interface moderna e reativa.
Captura de Áudio: AVFoundation para acessar o microfone e processar o áudio em tempo real. A biblioteca Accelerate pode ser usada para análises mais complexas como a FFT.
Captura de Vídeo/Luz: AVFoundation para acessar o feed da câmera e analisar o brilho dos frames.
Vibração: Core Haptics para criar padrões de vibração precisos que diferenciam pontos e traços.
Persistência: Core Data ou SwiftData para salvar o progresso do usuário, histórico e configurações.
Otimização: Focar no uso eficiente da bateria, especialmente durante a captura de vídeo e uso do flash, limitando a taxa de quadros (frame rate) e o processamento quando possível.

## Apps de Morse que já existem

No mercado brasileiro pra apps de Morse que já existem, com pontos fortes/fracos.

## Panorama de apps de código morse no Brasil

| Nome                              | Preço / Modelo de cobrança                                                                              | Recursos principais                                                                                                           | Avaliações / o que falta                                                                                                                                                                                     |
| --------------------------------- | ------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Mestre do Código Morse**        | R\$ 6,90 (compra única) ([Apple][1])                                                                    | Codificar/decodificar Morse, suporta mais de um tipo de código (internacional etc.), “reprodução automática”. ([Apple][1])    | Simples, função de automação; possível diferencial seria maior interatividade ou modos de captura (flash/microfone) mais robustos.                                                                           |
| **Telégrafo - Código Morse !**    | R\$ 12,90 ([Apple][2])                                                                                  | Jogo / modo educativo (“memorização ” através de jogos), visual lúdico. ([Apple][2])                                          | Foco em aprendizado / ludicidade; pode faltar funcionalidades de decodificação por som ou captura de flash real.                                                                                             |
| **Morse Mania: Learn Morse Code** | Grátis com compras internas / assinaturas (premium) — ex: assinatura mensal etc. ([Apple][3])           | Vários níveis de dificuldade, leitura/enviar, modos de saída diversos (flashlight, tela piscando, som, vibração) ([Apple][3]) | Bastante completo; custo pode ser alto dependendo de quanto liberar; uso contínuo pode ficar caro. Possivelmente não muito forte em captura em tempo real de sinais externos (microfone ou flash detectado). |
| **Transmissor de Código Morse**   | Grátis com compras internas / versão Pro etc. ([Apple][4])                                              | Conversão texto ↔ Morse, envio via vários modos (flashlight, tela piscando, som, vibração), prática, tutoriais. ([Apple][4])  | Boa variedade; reclamações sobre muitos anúncios e parte dos recursos bloqueados. Poderia melhorar usabilidade ou dar mais valor grátis antes de pagar.                                                      |
| **Código Morse - Mestre Morse**   | Grátis com compra interna para versão completa (unlock) \~ R\$ 2,90 para desbloquear tudo. ([Apple][5]) | Interface limpa, funções básicas de decodificação, ensino, som. ([Apple][5])                                                  | Boa para quem quer algo simples, mas não parece ter captura por microfone ou flash detectado ou modos avançados de interatividade.                                                                           |

---

## Oportunidades / lacunas que descobri (que seu app pode explorar como diferencial)

Com base nos apps existentes, vi que:

1. Muitos apps são focados **em aprender / treinar**, com quizzes, níveis, jogos, memorização.
2. A decodificação costuma ser em texto puro ou batida simples — poucos têm captura de **flash externo** ou captar sinais visuais via câmera ou ambiente real.
3. Captura de áudio existe, mas pode não ser robusta em ambientes barulhentos ou com variação de timbre (às vezes dependem de áudio limpo).
4. Muitas funções boas ficam atrás de paywalls, assinaturas caras ou muitos anúncios.
5. Poucos oferecem **telegrafo estilo toque**, ou emissão interativa avançada (pressionar, ritmo etc) como parte central.
6. Há pouco foco em **calibração automática / personalização** de thresholds, velocidades, visualização real-tempo do sinal captado.

---

## Fazer para se destacar

Com base nisso, algumas ideias para diferenciação:

* Implementar captura em tempo real com câmera para detectar flash no ambiente (por exemplo se alguém pisca uma luz ou lanterna) + microfone robusto, com filtros ou FFT para distinguir sinal verdadeiro de ruído.
* Permitir calibrar thresholds, velocidade, ruído — UI para ajustar.
* Oferecer versão “full funcional” bem usável sem pagar (bons recursos grátis) para atrair, com opções de melhoria opcional.
* Fazer interface visual forte / experiência fluida: animação, feedback visual do sinal, design limpo, dark mode, acessibilidade.
* Focar também em experiência de emissão interativa: telegrafo (toque), talvez exportar ou compartilhar sinais ou mensagens geradas, histórico.
* Talvez incorporar modos de “jogo de decodificação ao vivo”, desafios, etc, pra tornar atraente pra aprender.

## O que os usuários reclamam / desejam — “dores” comuns

1. **Anúncios excessivos**
   Vários usuários reclamam que há muitos anúncios, especialmente entre telas ou ao mudar de função. Isso atrapalha bastante o uso contínuo.
   Exemplo: no *Transmissor de Código Morse*, usuários dizem que o app “é bom, mas tem muita propaganda”. ([Apple][1])

2. **Recursos importantes bloqueados atrás de paywalls**

   * Funções como remoção de anúncios, uso de flash ou vibração, envio por diferentes modos, ou modos avançados de aprendizado costumam estar na versão paga. ([Apple][2])
   * Alguns apps oferecem a versão gratuita com funcionalidades limitadas e esperam que o usuário pague para desbloquear. Usuários reclamam que “mais da metade dos recursos são pagos”. ([Apple][1])

3. **Experiência de uso prejudicada por interface pouco amigável**

   * Navegação confusa entre telas ou menus pouco claros.
   * Interface que parece de “modelo genérico” sem UX muito trabalhada. (Esse tipo de comentário aparece principalmente em resenhas médias).
   * Configurações de velocidade ou de áudio/piscada não ajustáveis (ou ajustáveis de forma muito limitada). Usuários pedem mais controle. ([Canaltech][3])

4. **Problemas com tradução / decodificação em tempo real**

   * Alguns apps não decodificam sinais externos de som ou luz; ou decodificam somente de texto digitado.
   * Quando existe decodificação de áudio, em ambientes ruidosos a experiência é ruim. Usuários dizem que não conseguem distinguir sinais, ou que há atraso ou imprecisão.
   * Em apps educativos, pessoas que querem praticar sinais reais (flash ou som) dizem que essas funções são muito básicas ou pouco responsivas.

5. **Velocidade / timing inadequados**

   * Alguns usuários reclamam que os sinais piscam ou tocam muito rápido ou muito lento, sem ajuste.
   * Quebras de ritmo ou falta de clareza entre ponto, traço, letras ou palavras. Falta de ajuste de tempo entre os símbolos ou de espaçamento entre letras / palavras.

6. **Ausência de funcionalidade de captura ou input externo**

   * Muitas funções de decodificação são apenas a partir de texto ou áudio pré-gravado; poucos apps capturam o ambiente real (flash de luz, microfone) para interpretar sinais visuais/sonoros externos.
   * Usuários querem “verem luzes piscando do mundo real” ou “usar o microfone para captar som Morse ao vivo” e isso muitas vezes não existe.

7. **Compatibilidade / permissões / desempenho**

   * Alguns apps pedem permissões que os usuários consideram invasivas ou sem justificativa clara.
   * Em dispositivos mais antigos ou com hardware limitado, desempenho de decodificação ou reprodução pode ficar lento ou instável.
   * Sons ou flashs piscantes podem drenar bateria rapidamente, ou aquecer o aparelho.

---

## O que os usuários elogiam

Pontos que usuários destacam como bons ou desejados:

* **Facilidade para aprender** — apps com lições, quizzes, ensino visual são valorizados. Quem é iniciante gosta de modos de aprendizado interativos. ([Apple][2])
* **Variedade nos modos de saída** — poder usar som, vibração, luz da tela, flash da câmera são opções bem vistas. ([Apple][1])
* **Boa tradução texto ↔ Morse** bem feita, sem erros óbvios no código, precisão no conversor.
* **Design limpo / interface simples** — usuários preferem apps que não fiquem “ poluídos ” visualmente, com elementos claros.
* **Velocidade ajustável** — possibilidade de ajustar a unidade de tempo (o tempo de “dot” etc) é bastante citada como diferencial benéfico.

---

## Lições para tirar disso — como seu app pode resolver essas dores

Sugestões práticas que seu app pode incorporar para se diferenciar:

1. **SEO/descrição de App Store**: ser muito claro no que o app faz, especialmente nas funções de captura de áudio/luz, decodificação em tempo real, modos de ensino, etc — isso ajuda quem procura exatamente isso.

2. **Versão gratuita funcional**: muitas vezes os recursos pagos são críticos. Se você puder oferecer uma versão gratuita com funções de captura de som/luz e decodificação real, mesmo que com limitações, isso atrai bastante.

3. **Controle fino de velocidade / thresholds**: deixar o usuário ajustar timing, intensidade de som/luz, sensibilidade — isso resolve reclamações de “não consigo distinguir”.

4. **Interface limpa, UX suave**: menus simples, feedback visual claro (quando detecta sinal, mostrar imediatamente), evitar anúncios intrusivos. Talvez anúncios só em uma parte ou só para recursos extras.

5. **Captura externa robusta**: flash da câmera, luz ambiente, microfone, com filtros de ruído; melhorar o que muitos apps têm de forma superficial.

6. **Feedback em tempo real**: mostrar visualmente se o sinal está “ON” ou “OFF” (luz ou áudio), talvez um indicador de força (no áudio) ou brilho (na luz) para calibrar.

7. **Permissões com clareza**: explicar bem por que precisa da câmera, microfone, e só pedir o que for realmente necessário.

8. **Desempenho & uso eficiente de bateria**: otimizar áudio e uso do flash (se usar LED da câmera), talvez limitar frames de vídeo ou reduzir taxa de amostragem se compatível.
