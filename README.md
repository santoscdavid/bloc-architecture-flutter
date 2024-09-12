# bloc_architecture_flutter

About Example of the BLoC architecture pattern

### PTBR

BLoC (Business Logic Component)

É uma arquitetura altamente recomendada para projetos de médio e grande porte, pois oferece uma
abordagem clara para a separação de responsabilidades e o gerenciamento de estado, usando
programação reativa.

Streams:

o BLoC utiliza, não obrigatoriamente, Streams do Dart para gerenciar a comunicação entre
interface e lógica de negócio. Permitindo enviar eventos e receber respostas de maneira assíncrona.

Eventos:

São ações que disparam mudanças de estado da aplicação (Cliques ou carregamento de dados).

Estados:

O estado da interface é gerenciado por uma sequência de estados reativos. BLoC gera estados sempre
que eventos são processados

Reatividade:

A interface observa o estado do BLoC e reage sempre que o estado é atualizado, reconstruindo o
widget de acordo com o estado.

Vantagens:

- Separa as responsabilidades
- Escalável
- Facilidade para testes