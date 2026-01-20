<script>
/* Dark Mode Toggle for NexT Theme */
(function() {
  'use strict';
  
  // 添加暗黑模式切换按钮的CSS
  const darkModeCSS = `
    .dark-mode-toggle {
      position: fixed;
      top: 20px;
      right: 20px;
      width: 48px;
      height: 24px;
      border: 1px solid #ddd;
      border-radius: 12px;
      background: #fff;
      cursor: pointer;
      display: flex;
      align-items: center;
      padding: 2px;
      transition: all 0.3s ease;
      z-index: 1000;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    
    .dark-mode-toggle:hover {
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
      border-color: #ccc;
    }
    
    .dark-mode-toggle .toggle-icon {
      width: 18px;
      height: 18px;
      border-radius: 50%;
      background: linear-gradient(45deg, #FFB800, #FFA000);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 10px;
      transition: all 0.3s ease;
      transform: translateX(0);
      box-shadow: 0 1px 3px rgba(0,0,0,0.2);
      color: #fff;
    }
    
    body.dark .dark-mode-toggle {
      background: #333;
      border-color: #555;
      box-shadow: 0 2px 8px rgba(0,0,0,0.3);
    }
    
    body.dark .dark-mode-toggle:hover {
      border-color: #666;
      box-shadow: 0 4px 12px rgba(0,0,0,0.4);
    }
    
    body.dark .dark-mode-toggle .toggle-icon {
      background: linear-gradient(45deg, #4FC3F7, #29B6F6);
      transform: translateX(22px);
    }
    
    /* NexT 变量驱动的暗黑/明亮模式覆盖（手动切换优先于系统） */
    html[data-theme="dark"] {
      --body-bg-color: #282828;
      --content-bg-color: #2b2b2b;
      --card-bg-color: #333333;
      --text-color: #e0e0e0;
      --blockquote-color: #bbbbbb;
      --link-color: #9ecbff;
      --link-hover-color: #cde4ff;
      --brand-color: #dddddd;
      --brand-hover-color: #ffffff;
      --table-row-odd-bg-color: #2b2b2b;
      --table-row-hover-bg-color: #363636;
      --menu-item-bg-color: #333333;
      --btn-default-bg: #222222;
      --btn-default-color: #e0e0e0;
      --btn-default-border-color: #444444;
      --btn-default-hover-bg: #3a3a3a;
      --btn-default-hover-color: #ffffff;
      --btn-default-hover-border-color: #666666;
    }

    /* 强制明亮（覆盖系统暗色） */
    html[data-theme="light"] {
      --body-bg-color: #ffffff;
      --content-bg-color: #ffffff;
      --card-bg-color: #f5f5f5;
      --text-color: #333333;
      --blockquote-color: #666666;
      --link-color: #222222;
      --link-hover-color: #111111;
      --brand-color: #000000;
      --brand-hover-color: #ffffff;
      --table-row-odd-bg-color: #f9f9f9;
      --table-row-hover-bg-color: #f5f5f5;
      --menu-item-bg-color: #f5f5f5;
      --btn-default-bg: #111111;
      --btn-default-color: #ffffff;
      --btn-default-border-color: #111111;
      --btn-default-hover-bg: #ffffff;
      --btn-default-hover-color: #111111;
      --btn-default-hover-border-color: #111111;
    }

    /* 暗黑模式样式 */
    body.dark {
      background-color: #1a1a1a;
      color: #e0e0e0;
    }
    
    body.dark .header {
      background-color: #222;
      border-bottom-color: #333;
    }
    
    body.dark .site-meta {
      color: #e0e0e0;
    }
    
    body.dark .site-meta .site-title {
      color: #fff;
    }
    
    body.dark .site-nav {
      background-color: #222;
    }
    
    body.dark .menu .menu-item a {
      color: #e0e0e0;
    }
    
    body.dark .menu .menu-item a:hover {
      color: #fff;
    }
    
    body.dark .post {
      background-color: #2d2d2d;
      border-color: #404040;
    }
    
    body.dark .post-title {
      color: #fff;
    }
    
    body.dark .post-title a {
      color: #fff;
    }
    
    body.dark .post-meta {
      color: #aaa;
    }
    
    body.dark .post-body {
      color: #d0d0d0;
    }
    
    body.dark .post-body h1,
    body.dark .post-body h2,
    body.dark .post-body h3,
    body.dark .post-body h4,
    body.dark .post-body h5,
    body.dark .post-body h6 {
      color: #fff;
    }
    
    body.dark .sidebar {
      background-color: #222;
      border-color: #404040;
    }
    
    body.dark .sidebar-inner {
      background-color: #222;
    }
    
    body.dark pre {
      background-color: #1e1e1e;
      color: #d0d0d0;
      border-color: #404040;
    }
    
    body.dark code {
      background-color: #2d2d2d;
      color: #f0f0f0;
    }
    
    body.dark blockquote {
      background-color: #2d2d2d;
      border-left-color: #0070f3;
      color: #d0d0d0;
    }
    
    body.dark .pagination .page-number {
      background-color: #2d2d2d;
      color: #e0e0e0;
      border-color: #404040;
    }
    
    body.dark .pagination .page-number:hover {
      background-color: #404040;
    }
    
    body.dark .main-inner {
      background-color: #1a1a1a;
    }
    
    body.dark .content-wrap {
      background-color: #1a1a1a;
    }
    
    /* Chart.js 暗黑模式适配 */
    body.dark canvas {
      filter: brightness(0.9) contrast(1.1);
    }
    
    @media (max-width: 768px) {
      .dark-mode-toggle {
        top: 10px;
        right: 10px;
        width: 40px;
        height: 20px;
        border-radius: 10px;
      }
      
      .dark-mode-toggle .toggle-icon {
        width: 16px;
        height: 16px;
        font-size: 9px;
      }
      
      body.dark .dark-mode-toggle .toggle-icon {
        transform: translateX(18px);
      }
    }
  `;
  
  // 注入CSS
  const style = document.createElement('style');
  style.textContent = darkModeCSS;
  document.head.appendChild(style);
  
  // 检测系统主题偏好
  function getSystemTheme() {
    return window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
  }
  
  // 获取用户主题偏好（兼容旧键名）
  function getUserTheme() {
    const saved = localStorage.getItem('color-scheme') || localStorage.getItem('dark-mode');
    if (saved === 'dark' || saved === 'light') return saved === 'dark';
    if (saved !== null) return saved === 'true';
    return getSystemTheme(); // 默认跟随系统
  }
  
  // 应用主题（同步 html data-theme 与 body.dark，兼容自定义样式与 NexT 变量）
  function applyTheme(isDark) {
    document.documentElement.setAttribute('data-theme', isDark ? 'dark' : 'light');
    document.body.classList.toggle('dark', isDark);
  }
  
  // 创建切换按钮
  function createToggleButton() {
    const button = document.createElement('button');
    button.className = 'dark-mode-toggle';
    button.title = '切换暗黑模式';
    
    const icon = document.createElement('div');
    icon.className = 'toggle-icon';
    icon.innerHTML = '☀';
    button.appendChild(icon);
    
    // 初始化主题
    const isDark = getUserTheme();
    applyTheme(isDark);
    updateIcon(icon, isDark);
    
    // 点击事件
    button.addEventListener('click', function() {
      const currentlyDark = document.body.classList.contains('dark');
      const newDark = !currentlyDark;
      
      applyTheme(newDark);
      updateIcon(icon, newDark);
      
      // 保存到本地存储（兼容旧键）
      localStorage.setItem('color-scheme', newDark ? 'dark' : 'light');
      localStorage.setItem('dark-mode', newDark);
      
      // 平滑动画
      document.body.style.transition = 'background-color 0.3s ease, color 0.3s ease';
      setTimeout(() => {
        document.body.style.transition = '';
      }, 300);
    });
    
    document.body.appendChild(button);
  }
  
  // 更新图标
  function updateIcon(icon, isDark) {
    if (isDark) {
      icon.innerHTML = '🌙';
    } else {
      icon.innerHTML = '☀';
    }
  }
  
  // 监听系统主题变化（仅在未手动设置时跟随）
  function watchSystemTheme() {
    if (!window.matchMedia) return;
    const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
    const handler = function(e) {
      if (localStorage.getItem('color-scheme') === null && localStorage.getItem('dark-mode') === null) {
        const isDark = e.matches;
        const icon = document.querySelector('.toggle-icon');
        applyTheme(isDark);
        if (icon) updateIcon(icon, isDark);
      }
    };
    if (mediaQuery.addEventListener) mediaQuery.addEventListener('change', handler);
    else if (mediaQuery.addListener) mediaQuery.addListener(handler);
  }
  
  // 页面加载完成后创建按钮
  function init() {
    createToggleButton();
    watchSystemTheme();
  }
  
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
  
})();
</script>