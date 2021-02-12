from selenium import webdriver
import json


firefox_profile = webdriver.FirefoxProfile()
firefox_profile.set_preference('permissions.default.image', 2)
firefox_profile.set_preference('permissions.default.stylesheet', 2)
firefox_profile.set_preference('browser.cache.disk.enable', False)
firefox_profile.set_preference('browser.cache.memory.enable', False)
firefox_profile.set_preference('browser.cache.offline.enable', False)
firefox_profile.set_preference('network.http.use-cache', False)

driver_parent = webdriver.Firefox(firefox_profile=firefox_profile)
driver_child = webdriver.Firefox(firefox_profile=firefox_profile)


def fetch(url: str) -> None:
    # FIXME: memory leaking, maybe migrate to `pyppeteer`?
    driver_parent.get(url)

    daftar_penyakit = driver_parent.execute_script("return document.querySelectorAll('search-a-z-2')[0].shadowRoot.querySelectorAll('.menu-children')[0].querySelectorAll('.index-item')")
    for i, penyakit in enumerate(daftar_penyakit):
        # if (i + 1) < 1:  # resume if an error has occurred
        #     continue
        url = penyakit.find_element_by_tag_name('a').get_attribute('href')
        print(i+1, url)
        driver_child.get(url)

        try:
            content_html = driver_child.find_element_by_class_name('post-content').get_attribute('innerHTML')
            content_str = content_html.lstrip().rstrip()

            if '<h2>' in content_str:
                content_str = content_str.replace('</h2>', '$$$').split('<h2>')
            elif '<h3>' in content_str:
                content_str = content_str.replace('</h3>', '$$$').split('<h3>')
            else:
                content_str = content_str.replace('</h4>', '$$$').split('<h4>')

            nama_penyakit = penyakit.find_element_by_tag_name('a').get_attribute('innerHTML')
            content_str[0] = 'Definisi ' + nama_penyakit + '$$$' + content_str[0]
            content_json = {}

            for section in content_str:
                text = section.split('$$$', maxsplit=1)
                content_json[text[0].replace('\n', '').replace('<strong>', '').replace('</strong>', '')] = text[1].lstrip().rstrip()

            with open(f"./alodokter_penyakit_{nama_penyakit.lower().replace(' ', '_')}.json", 'w') as json_file:
                json.dump(content_json, json_file)
        except:
            print('Error: Content cannot be retrieved')

    driver_parent.quit()
    driver_child.quit()


fetch('https://www.alodokter.com/penyakit-a-z')
