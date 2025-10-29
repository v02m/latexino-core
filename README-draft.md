# xememoir — модульный стиль для memoir + XeLaTeX

Универсальный пакет для книг, диссертаций и технической документации с поддержкой ГОСТ.

---

## 🚀 Быстрый старт

### Установка

```bash
./script-install/setup_styles.sh
```

### Минимальный документ

\documentclass{memoir}
\usepackage[bookstyle=academic, liberation]{xememoir}
\begin{document}
\chapter{Введение}
Текст...
\end{document}

### Опции пакета

Шрифты

    msfonts — Times New Roman (по умолчанию)
    liberation — Liberation Serif/Sans
    cmu — Computer Modern Unicode

Макет (bookstyle=)

    classic — традиционная книга (ГОСТ)
    academic — диссертация
    poetry — поэтический сборник
    ... (остальные 5 стилей)

Графика (graphicstyle=)

    classic — ч/б (ГОСТ)
    colorful — полноцветная
    minimal — минимализм
    ... (ещё 2 стиля)

Списки (liststyle=)

    gost — а), б), в) → 1), 2), 3) (по умолчанию)
    numeric — 1) → 1.1) → 1.1.1)
    mixed — 1) → а) → A)
    alpha — a) → 1) → а)


    💡 Все опции взаимоисключающие внутри группы. Порядок не важен.

### Модули

#### Таблицы (tablesetup)

    Использует xltabular + booktabs (без вертикальных линий — ГОСТ).
    Альбомные таблицы: \begin{sidewaystable}...\end{sidewaystable}.
    Подписи сверху: \caption{...}.

\begin{table}
\caption{Пример}
\begin{xltabular}{\textwidth}{@{} l X @{}}
\toprule
Параметр & Описание \\
\midrule
Температура & Длинное описание... \\
\bottomrule
\end{xltabular}
\end{table}

#### Библиография (bibsetup)

    Требует: tlmgr install biblatex-gost
    Стиль: gost-numeric (числовые ссылки).
    Использование:

\autocite{key}
\printbibliography[title={Список литературы}]

#### Заметки (todo-setup)

    \unsure{...}, \change{...}, \inlinetodo{...}
    В финальной версии: добавьте в преамбулу
    \makeatletter\def\@final{}\makeatother

#### Листинги (listingssetup)

    Раскомментируйте в xememoir.sty, если нужно.
    Стиль — ч/б, с рамкой, без цвета (ГОСТ).

#### Советы

Установка шрифтов
tlmgr install collection-fontsrecommended
kpsewhich latinmodern-math.otf # проверка

#### Альбомные таблицы с 10+ столбцами

    Используйте \footnotesize, \setlength{\tabcolsep}{3pt}.
    Для альбома: \begin{xltabular}{\textheight}{...}.

#### Компиляция с библиографией

xelatex doc.tex
biber doc
xelatex doc.tex

### Известные особенности

    Предупреждения unicode-math безопасны — их нельзя подавить в TeX Live 2025.
    Не подключайте caption — используйте встроенные команды memoir.
    pdflscape не включён по умолчанию — подключайте вручную при необходимости.
