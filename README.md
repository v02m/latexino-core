# xememoir — модульный стиль для memoir + XeLaTeX

Универсальный, ГОСТ-совместимый стилевой пакет для написания книг, диссертаций, отчётов и конспектов на основе класса `memoir` с поддержкой XeLaTeX, `polyglossia` и русского языка.

> 💡 Проект построен по принципу **модульности**: каждый аспект оформления — от шрифтов до библиографии — вынесен в отдельный `.sty`-файл.  
> 🔜 Планируется разработка `xebeamer.sty`, `xestandard.sty` и других.

---

## 📥 Установка

1. **Клонируй репозиторий**:
   ```bash
   git clone https://github.com/valery/latexino-core.git
   cd latexino-core
   ```
2. **Запусти установочный скрипт:**
   ./script-install/setup_styles.sh
   Скрипт создаст символические ссылки в ~/texmf/tex/latex/latexino-core/,
   → Твой исходный код останется нетронутым — можно смело создавать бранчи и экспериментировать.

3 **Обнови базу TeX:**
texhash ~/texmf

✅ Теперь пакет доступен во всех документах:
\usepackage{xememoir}

## ⚙️ Опции пакета

Подключайте `xememoir` с нужными опциями:

```latex
\usepackage[bookstyle=academic, graphicstyle=colorful, liststyle=mixed, liberation]{xememoir}
```

Все опции взаимоисключающие внутри группы. Порядок не важен.

### **Выбор шрифтов**

msfonts Times New Roman, Arial, Courier New ( по умолчанию )
liberation Liberation Serif/Sans/Mono (свободные шрифты)
cmu Computer Modern Unicode
Если не указана — используется msfonts.

### Типографские профили (bookstyle=)

==Опция ==== Стиль Глав ==== Назначение ====
classic dash Традиционная книга, ГОСТ-дружелюбная
academic default Диссертация, отчёт (поля под переплёт)
modern bianchi Минимализм, тонкие линии
poetry ell Поэтический сборник (широкие поля)
technical veelo Техническая документация (узкие поля)
elegant pedersen Издательский шик
compact lyhne Экономия места (мелкий шрифт)
bold komalike Акцент на заголовках (sans-serif)

💡 По умолчанию: bookstyle=classic.

### 🎨 Стили графики (graphicstyle=)

===Опция ====== Описание =====
classic Ч/б, ГОСТ-совместимая
colorful Полноцветная, насыщенная палитра
minimal Тонкие линии, минимализм
technical Схемы, чертежи (технические цвета)
presentation Крупные элементы, контраст

💡 По умолчанию: graphicstyle=classic.

### 🔢 Стили списков (liststyle=)

=== Опция ========= Формат ========
gost а),б),в)→1),2),3) (по ГОСТ 2.105-95)
numeric 1) → 1.1) → 1.1.1)
mixed 1) → а) → A)
alpha a) → 1) → а)

💡 По умолчанию: liststyle=gost.

### Примеры использования

**1. Диссертация (ГОСТ)**

\usepackage[bookstyle=academic, liststyle=gost, msfonts]{xememoir}

**2. Технический отчёт с графикой**
\usepackage[bookstyle=technical, graphicstyle=technical, liberation]{xememoir}

**3. Поэтический сборник**
\usepackage[bookstyle=poetry, graphicstyle=minimal, cmu]{xememoir}

**4. Черновик с цветной графикой и смешанными списками**
\usepackage[bookstyle=modern, graphicstyle=colorful, liststyle=mixed, msfonts]{xememoir}

## 🧩 Модульная архитектура

Каждый аспект оформления вынесен в отдельный `.sty`-файл. Все модули **опциональны** и подключаются автоматически при наличии.

| Модуль              | Назначение                                                 | ГОСТ               |
| ------------------- | ---------------------------------------------------------- | ------------------ |
| `langsetup.sty`     | Русский язык, `spelling=modern`, `babelshorthands`         | ✅                 |
| `fontswitch.sty`    | Управление шрифтами (MS, Liberation, CMU)                  | ✅                 |
| `layoutsetup.sty`   | Поля, стили глав, колонтитулы (`memoir`-нативно)           | ✅                 |
| `graphicssetup.sty` | TikZ, профили графики, SVG (опционально)                   | ✅                 |
| `tablesetup.sty`    | Таблицы: `xltabular`, `booktabs`, `makecell`, `dcolumn`    | ✅                 |
| `enumsetup.sty`     | Списки: `а)`, `1)`, `A)` — по ГОСТ 2.105-95                | ✅                 |
| `mathsetup.sty`     | Математика: `unicode-math`, `amsmath`, команды `\R`, `\dd` | ✅                 |
| `bibsetup.sty`      | Библиография: `biblatex` + `gost-numeric`                  | ✅ ГОСТ 7.0.5–2008 |
| `todo-setup.sty`    | Заметки: `\unsure`, `\change`, `\listoftodos`              | 📝 (черновик)      |
| `listingssetup.sty` | Листинги кода (опционально)                                | ✅ ч/б, без цвета  |

> 💡 Все модули **не конфликтуют с `memoir`** и **не используют `geometry`, `fancyhdr`, `caption`**.

---

## 📐 Таблицы по ГОСТ

### Основные правила:

- **Подпись сверху**: «Таблица 1. Название» (точка + пробел).
- **Без вертикальных линий**.
- **Только `\toprule`, `\midrule`, `\bottomrule`** (`booktabs`).
- **Висячий отступ**: 1.25 см.
- **Абзацный отступ в первой строке записи** — **запрещён**.

### Пример:

```latex
\begin{table}[ht]
\centering
\caption{Сравнение шрифтов}
\begin{tabularx}{\textwidth}{@{} l X @{}}
\toprule
Шрифт & Описание \\
\midrule
Times New Roman & Стандартный для ГОСТ \\
Liberation & Свободная альтернатива \\
\bottomrule
\end{tabularx}
\end{table}
```

## 📏 Альбомные таблицы

\begin{sidewaystable}
\centering
\caption{Длинная таблица параметров}
\begin{xltabular}{\textheight}{@{} l X @{}}
\toprule
Параметр & Описание \\
\midrule
\endfirsthead
% ... содержимое ...
\end{xltabular}
\end{sidewaystable}

**✅ Преимущества:**

Таблица повёрнута, но номер страницы — вертикальный.
Совместимо с hyperref, memoir, ГОСТ.
Не требует --shell-escape.

❌ Не используйте \begin{landscape}...\end{landscape} — нарушает типографику.

## 📝 Списки по ГОСТ 2.105-95

    Маркированные списки:
        1-й уровень: длинное тире —
        2-й уровень: короткое тире --
        3-й уровень: звёздочка *


    Нумерованные списки:
        1-й уровень: а), б), в)
        2-й уровень: 1), 2), 3)
        3-й уровень: 1), 2), 3)

Включается через:
\usepackage[liststyle=gost]{xememoir}

## 📚 Библиография по ГОСТ 7.0.5–2008

    Стиль: gost-numeric (числовые ссылки в квадратных скобках).
    Сортировка: автор → год → заглавие.
    DOI/URL включены, ISBN — скрыт.
    Висячий отступ: 1.25 см.
    Все авторы отображаются (maxbibnames=99).

Использование:
\usepackage{bibsetup}
\addbibresource{myrefs.bib}

Цитата \autocite{petrov2020}.

\printbibliography[title={Список литературы}]

⚠️ Требуется установка:
tlmgr install biblatex-gost

## 🖥️ Листинги кода (опционально)

Активируйте вручную, раскомментировав в xememoir.sty:
\InputIfFileExists{listingssetup.sty}{}{}

Стиль:

    Моноширинный шрифт, \small.
    Рамка frame=single.
    Фон: gray!5 (почти незаметен при печати).
    Подпись сверху, как у таблиц.

\begin{lstlisting}[caption={Пример кода}]
print("Привет, мир!")
\end{lstlisting}

## Часть 4: Устранение проблем и режимы работы

## 🛠️ Распространённые проблемы и решения

### 1. **Шрифты не найдены (Latin Modern Math)**

Ошибка:
Font ... Latin Modern Math ... not loadable

**Решение**:

```bash
# Установи коллекцию шрифтов
tlmgr install collection-fontsrecommended

# Проверь наличие файла
kpsewhich latinmodern-math.otf
```

💡 Не используй \setmathfont{Latin Modern Math} — только \setmathfont{latinmodern-math.otf}.

### Переносы не работают (русский язык)

No hyphenation patterns were loaded for 'russian'

Решение:

# Для локальной TeX Live (в домашнем каталоге)

fmtutil-user --byfmt xelatex
⚠️ После установки новых языков всегда пересобирай форматы.

### 3. Ошибки Extra \fi, Undefined control sequence

Причина:
— Несбалансированные условия (\if...\fi) в .sty-файлах,
— Или флаги не экспортированы из xememoir.sty.

Решение:
— Убедись, что все \if...\fi сбалансированы,
— Проверь, что в xememoir.sty есть:
\let\ifliststyle@gost\if@xeml@gost
\let\ifgraphicstyle@colorful\if@xemg@colorful

### Предупреждения от unicode-math

I'm going to overwrite the following commands from mathtools...
Это не ошибка! — это информационное сообщение.
Оно подтверждает корректную интеграцию mathtools + unicode-math.

    ✅ Можно игнорировать. Опция quiet больше не поддерживается.

### 📝 Режимы: черновик vs финал

Черновик

    Все модули активны.
    Заметки видны: \unsure{...}, \change{...}.
    Используй microtype, todo-setup, listingssetup.

**Финал**

**1. Скрой заметки:**
\makeatletter\def\@final{}\makeatother
→ Все \todo автоматически исчезнут.

\*\*2. Отключи ненужные модули:\*\*
— Закомментируй \InputIfFileExists{todo-setup.sty}{} и listingssetup.sty.

\*\*3. Проверь переносы и Overfull \hbox:\*\*
— Включи \overfullrule=5pt для визуального контроля.

## 💻 Советы по редакторам

TeXstudio

    Установи цепочку компиляции:
    XeLaTeX → Biber → XeLaTeX → XeLaTeX
    Включи опцию: «Show log panel» для отладки.

VS Code + LaTeX Workshop

    Добавь в settings.json:

{
"latex-workshop.latex.recipes": [
{
"name": "xememoir",
"tools": ["xelatex", "biber", "xelatex", "xelatex"]
}
],
"latex-workshop.latex.tools": [
{
"name": "xelatex",
"command": "xelatex",
"args": ["-synctex=1", "-interaction=nonstopmode", "%DOC%"]
},
{
"name": "biber",
"command": "biber",
"args": ["%DOCFILE%"]
}
]
}

Предупреждения вроде
You have requested package 'xememoir', but the package provides 'enumsetup'
— это ошибки кэша редактора. Перезапусти VS Code / TeXstudio.

## 🧪 Тестовый документ

\documentclass{memoir}
\usepackage[bookstyle=academic, graphicstyle=colorful, liststyle=gost, liberation]{xememoir}

\addbibresource{sample.bib}

\begin{document}
\chapter{Введение}
Тест переносов: административно-территориальный.

\begin{enumerate}
\item Список по ГОСТ: а), б), в)
\end{enumerate}

\begin{figure}
\centering
\begin{tikzpicture}
\draw[accent] (0,0) circle (1cm);
\end{tikzpicture}
\caption{Цветная схема}
\end{figure}

Цитата \autocite{knuth1984}.

\printbibliography
\end{document}

**Компиляция:**
xelatex test.tex
biber test
xelatex test.tex
xelatex test.tex

## 🏁 Заключение

Пакет `xememoir` — это **модульная, ГОСТ-совместимая, типографски точная** система оформления для:

- диссертаций,
- технических отчётов,
- учебных пособий,
- поэтических сборников,
- и любых книг на основе `memoir`.

Он построен на принципах:

- **Чистоты**: никаких `geometry`, `fancyhdr`, `caption`.
- **Совместимости**: только нативные команды `memoir`.
- **Гибкости**: профили под любой жанр.
- **Безопасности**: режимы черновик/финал, опциональные модули.

> 💡 Используй, развивай, делай форк — и пиши красивые документы!

---

## 📚 Полезные ресурсы

| Тема                         | Ссылка                                                                                                    |
| ---------------------------- | --------------------------------------------------------------------------------------------------------- |
| Документация `memoir`        | [`texdoc memoir`](https://texdoc.org/serve/memoir/0)                                                      |
| `biblatex-gost`              | [CTAN: biblatex-gost](https://ctan.org/pkg/biblatex-gost)                                                 |
| `unicode-math`               | [CTAN: unicode-math](https://ctan.org/pkg/unicode-math)                                                   |
| TeX Live руководство         | [tug.org/texlive](https://www.tug.org/texlive/)                                                           |
| Локальная установка TeX Live | [install-tl-unx.tar.gz](https://mirror.macomnet.net/pub/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz) |

> ⚠️ При локальной установке TeX Live **избегайте `user mode`** (`fmtutil-user`, `updmap-user`) без необходимости — это нарушает обновляемость системы (см. [tug.org/texlive/scripts-sys-user.html](https://tug.org/texlive/scripts-sys-user.html)).

---

## 🙏 Благодарности

- **Команде TeX Live** — за стабильную и мощную систему.
- **Lars Madsen** — автору `memoir`.
- **Ivan A. Belikov** — автору `biblatex-gost`.
- **Will Robertson** — автору `unicode-math`.
- **Всем участникам CTAN** — за открытые пакеты.

---

## 📦 Лицензия

MIT License — свободно используй, модифицируй, распространяй.

---

> ✨ **Создано с любовью к типографике и LaTeX.**  
> — Valerie, 2025
