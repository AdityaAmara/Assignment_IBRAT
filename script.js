const tabs = document.querySelectorAll('[data-tab-target]')
const tabContents = document.querySelectorAll('[data-tab-content]')

tabs.forEach(tab => {
  tab.addEventListener('click', () => {
    const target = document.querySelector(tab.dataset.tabTarget)
    tabContents.forEach(tabContent => {
      tabContent.classList.remove('active')
    })
    tabs.forEach(tab => {
      tab.classList.remove('active')
    })
    tab.classList.add('active')
    target.classList.add('active')
  })
})

document.getElementById("open-popup-btn").addEventListener("click",function(){
  document.querySelector(".bg-modal").style.display = 'flex';
});
 
document.getElementById("cross").addEventListener("click",function(){
  document.querySelector(".bg-modal").style.display = 'none';
});