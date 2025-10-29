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
