-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 166.594131 , 188.248138 , 12.658071 , 8.099995 , [[Camera:ScriptSplineLookAtPosition(150.708,196.783,12.500);]] )
   Camera:MotionSpline_AddSplinePoint( 167.612198 , 197.301743 , 11.188937 , 5.099998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 165.231537 , 202.552841 , 11.159193 , 7.999995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 158.826279 , 208.076813 , 11.291227 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
