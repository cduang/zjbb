@echo off
:: 设置编码为 UTF-8，防止中文乱码
chcp 65001 >nul

echo ========================================
echo       开始自动同步代码到 GitHub
echo ========================================
echo.

echo [1/4] 正在添加所有文件...
git add .

echo.
echo [2/4] 正在提交更改...
:: 使用当前日期和时间作为提交信息
git commit -m "Auto-commit: %date:~0,10% %time:~0,8%"

echo.
echo [3/4] 正在拉取远程最新代码...
:: --no-edit 可以防止跳出 Vim 编辑器界面卡住脚本
git pull origin main --no-edit

echo.
echo [4/4] 正在推送到 GitHub...
git push

echo.
echo ========================================
echo             执行完毕！
echo ========================================
pause