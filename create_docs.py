from jinja2 import Template
import yaml
import glob
import os

base_dir = os.path.dirname(os.path.realpath(__file__))
source_dir = os.path.join(base_dir, "source")
doc_dir = os.path.join(base_dir, "docs")
source_files = glob.glob(f"{source_dir}/*.yml")

def create_docs(source_file):
    if not os.path.exists(doc_dir):
        os.makedirs(doc_dir)
    with open(source_file, 'r') as raw_yaml_data:
        yaml_data = yaml.safe_load(raw_yaml_data)
        with open(os.path.join(base_dir, "template.md.j2")) as template_file:
            template = Template(template_file.read())
            output = template.render(yaml_data)
            f = open(os.path.join(doc_dir,f"{yaml_data['CHAIN']}_{yaml_data['CHAIN_TYPE']}_snapshot.md"), "w")
            f.write(output)
            f.close

def main():
    for file in source_files:
        print(f"Source File: {file}")
        create_docs(file)

if __name__ == "__main__":
    main()