-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 649.874817 , 100.398102 , 23.277451 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(609.093,199.059,24.000);]] )
   Camera:MotionSpline_AddSplinePoint( 636.165833 , 94.579910 , 25.427452 , 9.099998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 620.129883 , 95.780312 , 26.977451 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 601.555115 , 102.059059 , 29.977451 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
