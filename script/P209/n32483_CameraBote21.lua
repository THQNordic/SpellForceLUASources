-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 296.706085 , 434.669647 , 17.856499 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(300.734,441.797,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 296.706085 , 434.669647 , 17.856499 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(300.734,441.797,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 296.706085 , 434.669647 , 17.856499 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(300.734,441.797,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 296.706085 , 434.669647 , 17.856499 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(300.734,441.797,15.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
