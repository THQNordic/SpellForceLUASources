-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 91.436333 , 348.213867 , 31.286671 , 19.600039 , [[Camera:ScriptSplineLookAtPosition(93.750,362.699,31.240);
]] )
   Camera:MotionSpline_AddSplinePoint( 90.936333 , 348.213867 , 31.286671 , 13.000013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 90.036331 , 348.213867 , 31.286671 , 19.500038 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 89.436333 , 348.213867 , 31.286671 , 39.299973 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
