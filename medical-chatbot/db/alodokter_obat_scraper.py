from selenium import webdriver
import json


firefox_profile = webdriver.FirefoxProfile()
firefox_profile.set_preference('permissions.default.image', 2)
firefox_profile.set_preference('permissions.default.stylesheet', 2)
firefox_profile.set_preference('browser.cache.disk.enable', False)
firefox_profile.set_preference('browser.cache.memory.enable', False)
firefox_profile.set_preference('browser.cache.offline.enable', False)
firefox_profile.set_preference('network.http.use-cache', False)


def fetch(url, index):
    driver_parent = webdriver.Firefox(firefox_profile=firefox_profile)
    driver_child = webdriver.Firefox(firefox_profile=firefox_profile)

    driver_parent.get(url)

    daftar_obat = driver_parent.execute_script("return document.querySelectorAll('search-a-z-2')[0].shadowRoot.querySelectorAll('.menu-children')[0].querySelectorAll('.index-item')")
    for i, obat in enumerate(daftar_obat):
        if (i + 1) < 631:  # resume if an error has occurred
            continue
        url = obat.find_element_by_tag_name('a').get_attribute('href')
        print(i+1, url)
        driver_child.get(url)
        try:
            content_html = driver_child.find_element_by_class_name('post-content').get_attribute('innerHTML')
            content_str = content_html.lstrip().rstrip()
            nama_obat = obat.find_element_by_tag_name('a').get_attribute('innerHTML').lower().replace(' ', '_')
            content_json = {nama_obat: content_str}
            with open(f"./alodokter_obat_{nama_obat}.json", 'w') as json_file:
                json.dump(content_json, json_file)
        except:
            print('Error: Content cannot be retrieved')

    driver_parent.quit()
    driver_child.quit()


fetch('https://www.alodokter.com/obat-a-z', 1)
