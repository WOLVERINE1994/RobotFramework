import xml.etree.ElementTree as ET

def convert_robot_to_junit(robot_xml):
    # Parse the Robot Framework XML
    robot_tree = ET.parse(robot_xml)
    robot_root = robot_tree.getroot()

    # Create the root of the JUnit XML
    junit_testsuites = ET.Element('testsuites')

    # Iterate over each suite
    for suite in robot_root.findall('.//suite'):
        suite_name = suite.get('name') or 'Unnamed Suite'
        junit_testsuite = ET.SubElement(junit_testsuites, 'testsuite')
        junit_testsuite.set('name', suite_name)
        
        tests = suite.findall('.//test')
        junit_testsuite.set('tests', str(len(tests)))

        # Iterate over each test in the suite
        for test in tests:
            test_name = test.get('name') or 'Unnamed Test'
            junit_testcase = ET.SubElement(junit_testsuite, 'testcase')
            junit_testcase.set('name', test_name)

            # Extract keywords (steps) and statuses
            keywords = test.findall('.//kw')
            for kw in keywords:
                kw_name = kw.get('name')
                kw_status = kw.find('status')
                kw_status_text = kw_status.get('status') if kw_status is not None else 'PASS'

                # Create a sub-element for each step
                junit_step = ET.SubElement(junit_testcase, 'kw')
                junit_step.set('name', kw_name)
                junit_step.set('status', kw_status_text)

                # Add failure or skipped elements based on step status
                if kw_status_text == 'FAIL':
                    failure = ET.SubElement(junit_step, 'failure')
                    failure.set('message', kw_status.get('message') or 'Step failed')
                elif kw_status_text == 'SKIP':
                    skipped = ET.SubElement(junit_step, 'skipped')
                    skipped.set('message', kw_status.get('message') or 'Step skipped')

            # Check the overall test status and add corresponding elements
            status = test.find('status')
            if status is not None:
                status_text = status.get('status')
                if status_text == 'FAIL':
                    failure = ET.SubElement(junit_testcase, 'failure')
                    failure.set('message', status.get('message') or 'Test failed')
                elif status_text == 'SKIP':
                    skipped = ET.SubElement(junit_testcase, 'skipped')
                    skipped.set('message', status.get('message') or 'Test skipped')

    # Convert the JUnit XML tree to a string
    junit_tree = ET.ElementTree(junit_testsuites)
    junit_xml_path = 'C:/Users/Prateek/Documents/browserstack-robot Framework/robot-browserstack-sdkLatest/robot-browserstack-sdkLatest/robot-browserstack-sdkLatest/junit_output.xml'
    junit_tree.write(junit_xml_path, encoding='utf-8', xml_declaration=True)
    return junit_xml_path

# Convert the provided XML file
robot_xml_file = 'C:/Users/Prateek/Documents/browserstack-robot Framework/robot-browserstack-sdkLatest/robot-browserstack-sdkLatest/robot-browserstack-sdkLatest/output.xml'
junit_xml_file = convert_robot_to_junit(robot_xml_file)
print(f"JUnit XML file created: {junit_xml_file}")