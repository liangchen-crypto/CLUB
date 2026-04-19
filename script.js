document.addEventListener('DOMContentLoaded', () => {
    // Navbar Scroll Effect
    const header = document.getElementById('header');
    
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });

    // Intersection Observer for scroll animations
    const observerOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('is-visible');
                observer.unobserve(entry.target); // Stop observing once it's visible
            }
        });
    }, observerOptions);

    const animatedElements = document.querySelectorAll('.animate-on-scroll');
    animatedElements.forEach(el => observer.observe(el));
    
    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const targetId = this.getAttribute('href');
            if(targetId === '#') return;
            
            e.preventDefault();
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                // Adjust for sticky header
                const headerHeight = header.offsetHeight;
                const elementPosition = targetElement.getBoundingClientRect().top;
                const offsetPosition = elementPosition + window.pageYOffset - headerHeight;
                
                window.scrollTo({
                    top: offsetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });
});

    // Language Modal Logic
    const langModal = document.getElementById('entryLangModal');
    const closeLangModalBtn = document.getElementById('closeEntryModal');

    if (langModal && closeLangModalBtn) {
        // Check if user has already visited and selected a language
        const hasSelectedLang = localStorage.getItem('ulc_lang_selected');
        
        if (!hasSelectedLang) {
            langModal.style.display = 'flex';
        }

        // Handle language option clicks
        const langBtns = document.querySelectorAll('.entry-lang-btn');
        langBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                localStorage.setItem('ulc_lang_selected', 'true');
            });
        });

        // Handle continue button
        closeLangModalBtn.addEventListener('click', () => {
            localStorage.setItem('ulc_lang_selected', 'true');
            langModal.style.display = 'none';
        });
    }

// Tab switching logic for Scenarios section
function openTab(evt, tabName) {
    // Hide all tab content
    const tabContents = document.getElementsByClassName("tab-content");
    for (let i = 0; i < tabContents.length; i++) {
        tabContents[i].classList.remove("active");
    }

    // Remove active class from all buttons
    const tabBtns = document.getElementsByClassName("tab-btn");
    for (let i = 0; i < tabBtns.length; i++) {
        tabBtns[i].classList.remove("active");
    }

    // Show current tab and set active class to clicked button
    document.getElementById(tabName).classList.add("active");
    evt.currentTarget.classList.add("active");
}
